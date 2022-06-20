Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136C552031
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:18:27 +0200 (CEST)
Received: from localhost ([::1]:36900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JAY-0003nB-5O
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J7h-0001cH-4R
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J7f-0000cF-Lh
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738127;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ft5HIlX5Ot6zOyVYxMDET9fsyEAlRyXwvWwtyvsnIGk=;
 b=XTg6M3/13FGTS/Lu22l7SHhgE8iK5EbBTU0I74marH3DP+wJpAelC9fmNGVtBtH25O7i3/
 1gdQaritQd0Z8ueA44eoHpv/viApPIggoRBOBQ8K+rA6gl3/2vLhU7y7XMHthXYcz9cnwS
 sQqw/2d3er1AZX1FaqqBTX+IOF1OzBw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-TcON3-egPGSMPI84xf1HNQ-1; Mon, 20 Jun 2022 11:15:24 -0400
X-MC-Unique: TcON3-egPGSMPI84xf1HNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p6-20020a05600c358600b0039c873184b9so5131543wmq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ft5HIlX5Ot6zOyVYxMDET9fsyEAlRyXwvWwtyvsnIGk=;
 b=TOS6qQG34Ql0IC85jWOmYh003tAkjoh0AP1O8bb/KYQPI9RyqLMPtnFAc8spJTDU3O
 vBykp5aVOpkSHl3n7zmdcAHbJOq/sP5QfY37BO2nyleQAvFZs5G/gHsiNjWzY/QAg+73
 1977Yu1KNxSQlod6ixErFSTG+Mnpp+sNicU9PJqomknCx0THy8sYnaZ3Z8GGRUEU6HPj
 JBFGwRNx5tv4qyfCqi62sREtutijmCwUDSq8YGPuagfkzvjn6GFaNBbn4jxNS+aCMAtT
 z4AZ9P5uwY1yo1/U3t8eclGJT0Oyu9ektz3sEXGSsy6w5caAyX6nmXqKlYp70aEOEQD9
 bbPA==
X-Gm-Message-State: AJIora8m6i8l4yge/k9eZe52HVOVS/spRxBIYSRlLFn7rdj/91ZDPrL0
 et/jyLh3VPqOVozb3OcgRfl7dIT8QGDn2kjpy0ZmBEN5hXU17PQzJAgBEb7d7xXd+PznG5fOLqw
 q4oODHKTV2c94bcI=
X-Received: by 2002:a5d:4d02:0:b0:21b:89e9:87a9 with SMTP id
 z2-20020a5d4d02000000b0021b89e987a9mr9946741wrt.601.1655738123583; 
 Mon, 20 Jun 2022 08:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umDdk33/3at5mwF2yjDhVJ6ybfnhjZFulwhCU2n+vqpA9gVEs5Qg3sz8cXSdqqgdYCDGICJg==
X-Received: by 2002:a5d:4d02:0:b0:21b:89e9:87a9 with SMTP id
 z2-20020a5d4d02000000b0021b89e987a9mr9946714wrt.601.1655738123365; 
 Mon, 20 Jun 2022 08:15:23 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d4349000000b0021004d7d75asm13823258wrr.84.2022.06.20.08.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:15:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 08/21] migration: rename qemu_file_update_transfer to
 qemu_file_acct_rate_limit
In-Reply-To: <20220620110205.1357829-9-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:52
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-9-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:15:22 +0200
Message-ID: <87h74f2wol.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The qemu_file_update_transfer name doesn't give a clear guide on what
> its purpose is, and how it differs from the qemu_file_credit_transfer
> method. The latter is specifically for accumulating for total migration
> traffic, while the former is specifically for accounting in thue rate
> limit calculations. The new name give better guidance on its usage.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


