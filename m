Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AB55201D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:15:11 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3J7N-0008NK-8k
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J3a-0003nD-38
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J3Y-0008ML-FD
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655737871;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9+9M+vOcYNKRHhKbBJpgaSjOrCElkmjnm09fNGThmg=;
 b=AWsf3Ag1lt/U9XKVS8I+KYNEtYsOdSD35Ki54Bb6Q2wOSC3+XpsyFqo3VpMpNPnVwJ8AeS
 D/wy+6zNT+F5mm5FhMJEKjHqgndhiBGDBh+5emJt+pztVFKXcOs+oDIHOipJJK9p4qr4g8
 cCwottKeyViR9AzUMRlG7t8zjtUH+jw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-JnYSgVspOPGm3RVpdUxtDw-1; Mon, 20 Jun 2022 11:11:10 -0400
X-MC-Unique: JnYSgVspOPGm3RVpdUxtDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i188-20020a1c3bc5000000b0039db971c6d9so5720734wma.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m9+9M+vOcYNKRHhKbBJpgaSjOrCElkmjnm09fNGThmg=;
 b=sQKdHeGDt4cKY3kWDiQuU9/czZ6KWSDbyeyw/vGUDfWSHZqwv47mqgzkKmDmkv6dBa
 JW377pEm7HmiGsVlgXmSXDVbyNu+xesWf3fHuRM+05/FkPz/x6xplPheti3P2f7Z/K70
 Xm8QqnZWIl1egLw1CegjaH15xF7tEfByhR/u1NtZS4sHwQ5n1t+wqZFtg7ycvDCUi3JV
 q1YqadcJpCyLOsEHf5xBe7x29aqaDfcM9vocF4udwy81Jah5jO/l9dwdoj13q8Lm49zv
 oqNRaBsegA8R5mIw/gq7Rf4V55vvrnmyVAR+LbB8lqbXA6BJ3DGy39c4LkqzntsQlzsk
 peow==
X-Gm-Message-State: AJIora8q8oHdlCdEXq9Dfi83lZIlm5qRHZWYtfwUHW3Rntu272ZKz3RM
 neb6OVuOvSLoPfqaGB0ijgS4HK31XQpZRcgHWvSXv016gzi/wFkoT/al+PO/TYNW8F1NXakAbdc
 5NL/xPdP50jMKM5g=
X-Received: by 2002:a5d:5847:0:b0:219:b512:3be2 with SMTP id
 i7-20020a5d5847000000b00219b5123be2mr23932369wrf.651.1655737869061; 
 Mon, 20 Jun 2022 08:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUtok8LtDRNaxboll/fuFQ6ODX72/mj9dursWas3XN1yscR8F31ks+Y9FUQoie/v38abv3wQ==
X-Received: by 2002:a5d:5847:0:b0:219:b512:3be2 with SMTP id
 i7-20020a5d5847000000b00219b5123be2mr23932340wrf.651.1655737868765; 
 Mon, 20 Jun 2022 08:11:08 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 d11-20020adffbcb000000b0020fcaba73bcsm13609329wrs.104.2022.06.20.08.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:11:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 03/21] migration: remove unreachble RDMA code in
 save_hook impl
In-Reply-To: <20220620110205.1357829-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:47
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-4-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:11:07 +0200
Message-ID: <8735fz4bg4.fsf@secure.mitica>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> The QEMUFile 'save_hook' callback has a 'size_t size' parameter.
>
> The RDMA impl of this has logic that takes different actions
> depending on whether the value is zero or non-zero. It has
> commented out logic that would have taken further actions
> if the value was negative.
>
> The only place where the 'save_hook' callback is invoked is
> the ram_control_save_page() method, which passes 'size'
> through from its caller. The only caller of this method is
> in turn control_save_page(). This method unconditionally
> passes the 'TARGET_PAGE_SIZE' constant for the 'size' parameter.
>
> IOW, the only scenario for 'size' that can execute in the
> qemu_rdma_save_page method is 'size > 0'. The remaining code
> has been unreachable since RDMA support was first introduced
> 9 years ago.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

You missed this call:

@@ -1571,18 +1547,6 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, st=
ruct ibv_cq *cq,
         if (rdma->nb_sent > 0) {
             rdma->nb_sent--;
         }
-
-        if (!rdma->pin_all) {
-            /*
-             * FYI: If one wanted to signal a specific chunk to be unregis=
tered
-             * using LRU or workload-specific information, this is the fun=
ction
-             * you would call to do so. That chunk would then get asynchro=
nously
-             * unregistered later.
-             */
-#ifdef RDMA_UNREGISTRATION_EXAMPLE
-            qemu_rdma_signal_unregister(rdma, index, chunk, wc.wr_id);
-#endif
-        }

But as RDMA_UNREGISTRATION_EXAMPLE has never been set, I am sending a
separate patch to remove it.

Later, Juan.


