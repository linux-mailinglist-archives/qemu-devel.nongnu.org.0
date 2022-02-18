Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD1F4BB5BC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 10:36:21 +0100 (CET)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKzga-0004MX-0N
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 04:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKze2-00036F-SV
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 04:33:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKzdz-0002zE-4E
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 04:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645176816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=31XiIRuFAJ8W4biedvCefKy15wemZwMlY+cQcD0mkpw=;
 b=cmlBVEN3/BRNAsmkxNHC25+tCruKrggEGoPABJbuLvV/2dusdNkIBofvPtiAViP+3OW1e4
 ec0TGA/85uWZV3szfCN1ypaDCWQjs8pnGHwmSTcV446seZw3HncTIkc1Aco83zy0y13CqA
 LJT92WxKeZfMOiIRL7Ze19ZCw4tjxWk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-_jmKdAuzM9Gj3pSM8WBWaQ-1; Fri, 18 Feb 2022 04:33:35 -0500
X-MC-Unique: _jmKdAuzM9Gj3pSM8WBWaQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 o4-20020a170906768400b006a981625756so2822910ejm.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 01:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=31XiIRuFAJ8W4biedvCefKy15wemZwMlY+cQcD0mkpw=;
 b=kHT5txAMp06Hb+1Nrkr9mKjJJRy6FH7Kt6EJ91vyxoe2AJUv3OqL56tIM0IrlImIFr
 rKGyYWze0JkG0Llw9BxzGW1iyxYDBmcsavWL2/I9MUwlForrXjCcrlXQ4WEfeK2mNVva
 xjoEmtp7xN50jvFcf5JswONS8vBsqGQp1E0PaH2wEJipLzqtYZyD3eX2Jhw31iLWJr7z
 2PxUc4HXz8nsXPM/24ZWPTa3djCmVnA/JiTsOtZqac0xP7pdklitwT0rbRA15ge5qZeb
 IxQMzWNHjrNpCwxMDzjM/cWXILPjO5VVEAlq4WjjGg3+HL3QSXeXI0G5k32ZJTmjCGFQ
 s1tg==
X-Gm-Message-State: AOAM532CJPUXlnv3wbLmJO/VujmQGFAjyG9k1m3gbj5+sdVoxxzN9wTi
 qwNZmdrNFdjlpihikXJH+K1AkjFPXbXyxwOINXIxTWIG5F5RBad06OZH6mtv9V1adeaeZz477vt
 cmcKXYVtUu7xnoBg=
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr5846676ejx.620.1645176814465; 
 Fri, 18 Feb 2022 01:33:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlOjtBIz1H77grbnDi70KeGDEp+q4WrPptO4dgGuthwtnxZ/UUlGPlGkxLykaZ7w9SAdbEmg==
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr5846643ejx.620.1645176814079; 
 Fri, 18 Feb 2022 01:33:34 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id ek26sm2056772edb.68.2022.02.18.01.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 01:33:33 -0800 (PST)
Date: Fri, 18 Feb 2022 04:33:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20220218043138-mutt-send-email-mst@kernel.org>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220218032528-mutt-send-email-mst@kernel.org>
 <Yg9eANNMYbaqD3cj@apples>
MIME-Version: 1.0
In-Reply-To: <Yg9eANNMYbaqD3cj@apples>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 09:51:12AM +0100, Klaus Jensen wrote:
> On Feb 18 03:26, Michael S. Tsirkin wrote:
> > On Thu, Feb 17, 2022 at 06:44:49PM +0100, Lukasz Maniak wrote:
> > > Changes since v4:
> > > - Added hello world example for SR-IOV to the docs
> > > - Moved AER initialization from nvme_init_ctrl to nvme_init_state
> > > - Fixed division by zero issue in calculation of vqfrt and vifrt
> > >   capabilities
> > 
> > 
> > So do you want to merge it all with nvme bits? which tree is this for?
> > Or would you like me to merge the pci bits for now?
> > Thanks!
> > 
> 
> I was wondering how to approach that as well. I think maybe it could all
> go through your tree so the pcie bits doesnt just sit their without
> being used by anything? It's up to you, but note that nvme bits are not
> fully reviewed yet.
> 
> If you are fine with merging the pcie bits then lets do that and we
> merge the nvme bits through the nvme tree. The nvme bits is fully acked,
> so it will go in, just need to finalize the reviews.

Yes, I'm fine with this.

-- 
MST


