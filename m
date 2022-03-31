Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E24EE2AF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:33:37 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1U8-0001m0-Th
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:33:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1na1Sv-0008Ug-00
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1na1Ss-0005Ba-Gf
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648758737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ioeXsxabNBCfNMseq0QvSPrDY7sFlzLLHg03Dv2U+9g=;
 b=FoQHjarPZYt8EUvkxmLkhKHE/ksUoTig0zmMcSl1Up7wmsRHK/oRxDbJpDlv8lbKox8Wwq
 plkhe94vENoIsssK+SVYtTbF6zhuzKSA1fc56Tw1ysZX1cArl9EhN9IjVxftLB9VV41TIf
 eDqeFAXhs7pJ2SSnpnHMDVZDtDGvDwY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-jlshdthaOveJ5Uu9eIDJ0Q-1; Thu, 31 Mar 2022 16:32:16 -0400
X-MC-Unique: jlshdthaOveJ5Uu9eIDJ0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 z16-20020a05600c0a1000b0038bebbd8548so1845016wmp.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ioeXsxabNBCfNMseq0QvSPrDY7sFlzLLHg03Dv2U+9g=;
 b=zsVgPpESL4vK3eaffNdeVFWr1eupIx8wZ4UF+szxpQ/AH0dTsk4i5eT88hY1PX6CTB
 s9sFYT3iI44PKoFkunmb3u8yF0bvSFHSK9jlp9hFXIZZfamtO7MplISCUaLmXl0TcxjL
 ECGP0b4ED0lhkRBCrIxmNIlIYxfW56zj3UAiTyJLQzhSI9cmEVVc5XvSAKKtT2Cxo92Y
 wfGuawl5t2LgTwJcub5qBOy4ytkhCOvCOxx8OwoMrhZ+2KWww0E08qMyJfnQ6UprblaC
 vAEFYoh/BLEG3x2sH7ukPEbzXUSkeuua7wqQStoo7NRAdVjUc+3AHN8mjxdWcaT5wHC6
 cGdQ==
X-Gm-Message-State: AOAM530wMKN2BLCrvV4k/EL99JcjHRKRndrdEckzljUSiaHkpdBsDzsx
 K/cQD8igszelS3eN/E4fXzE51w515Q5VX3TFq+16loWGBQSrivv1b58XoClZAip6JljZBpmfDTw
 tLZjSNQrAzmgzU7o=
X-Received: by 2002:a05:6000:15c5:b0:204:901:af44 with SMTP id
 y5-20020a05600015c500b002040901af44mr5375759wry.714.1648758735100; 
 Thu, 31 Mar 2022 13:32:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMbZakgV9ZTD2Y0/HTEdITiU0bj0ArJ2kaKizFH2f4t3TXUiiubH2VTJVKONA9mOyoz5G/aw==
X-Received: by 2002:a05:6000:15c5:b0:204:901:af44 with SMTP id
 y5-20020a05600015c500b002040901af44mr5375747wry.714.1648758734919; 
 Thu, 31 Mar 2022 13:32:14 -0700 (PDT)
Received: from redhat.com ([2.55.151.201]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b0038cb84f4218sm257823wmq.27.2022.03.31.13.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:32:13 -0700 (PDT)
Date: Thu, 31 Mar 2022 16:32:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Qiu <qiudayu@archeros.com>
Subject: Re: [PATCH RESEND v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
Message-ID: <20220331163118-mutt-send-email-mst@kernel.org>
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <6245804d.1c69fb81.3c35c.d7efSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <6245804d.1c69fb81.3c35c.d7efSMTPIN_ADDED_BROKEN@mx.google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: lulu@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 eperezma@redhat.com, Si-Wei Liu <si-wei.liu@oracle.com>,
 lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 06:19:37PM +0800, Michael Qiu wrote:
> Hi, Jason
> 
> Does it work this time?

Nope. Just use git-send-email.

-- 
MST


