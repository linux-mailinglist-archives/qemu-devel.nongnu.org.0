Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4B4F16A2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 15:58:22 +0200 (CEST)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbNDp-0000g5-3D
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 09:58:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nbNB5-0007Xh-NW
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 09:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nbNB2-0007ud-CL
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 09:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649080526;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XsdrDuo/xoUOiJ+oek9AbS2j169+aO3LFr3iX8UU6E=;
 b=DF10Lyq+dfgkVwt1wM2tLabwWChFCRhd4tR61CQh9Bwss32FLuGqFZ9WCdMk7ngp9c9DEy
 ZC5kb9n0FE/y0AtVcO9D5/S9/GPAKb5VQUHM6/4ouuLdb2uLGDxPkbswZoRnQxG7+nkSM4
 WGYOQaTD6DvRfx128VcYPsCJtpxlCgc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-ySUMPV4WPJ2biyv21bePJg-1; Mon, 04 Apr 2022 09:55:25 -0400
X-MC-Unique: ySUMPV4WPJ2biyv21bePJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d7000000b0038e6a1b25f1so3162373wma.7
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XsdrDuo/xoUOiJ+oek9AbS2j169+aO3LFr3iX8UU6E=;
 b=F9j2QTeZ/NpGsUjpRgqhIRF7t66rRlr5gwP4hcmHaDkKCx+ma0+1hSHPHyykflry0z
 WSwTbcj2z2PD7gqEvxaXXoZZlFB4RCNKI9vaatMEsXxEgmC6EWPZTDxjRVs2JqlsMGa/
 deLWX+uaS413jorfQAN7fj2dbM0NCm+FYBybyh8HS8wom1+PwwLzOzfyddj5GHLEP7kg
 KNrv/xT6dpL0yjdMlcMHFPAapVX2AHrhBwdM4IldW6JBoj4Rh98WFSe+5ucIPEJBMJ96
 QFeXxxPwGuHaugHgazmuNqQphMkkVLbJ7IoQMJHIRxZJUP57rC5QGQQ23iRRHSkFCaqL
 ExDg==
X-Gm-Message-State: AOAM533dkF2MeZVaJJYOhF+MVXxm+7OScR0zqyLk1r/ze8nHx4+YLOT4
 sq29BPCoY7tHITqnMKZHd6l1lGfgyDvelmfQYi2VBhNffelnDO7/9/OwVxn7giXy33jk/V+owhi
 hbFU5gZvj+TRL60w=
X-Received: by 2002:a05:600c:1548:b0:38c:ef05:4cdd with SMTP id
 f8-20020a05600c154800b0038cef054cddmr19622682wmg.71.1649080524405; 
 Mon, 04 Apr 2022 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj5a2IxSvyB7nWHhkNya2t/R+HYMN129oqOrP5cZrwSDDL4qfgCCpgiCqNCnmuCV6PqEg3Gg==
X-Received: by 2002:a05:600c:1548:b0:38c:ef05:4cdd with SMTP id
 f8-20020a05600c154800b0038cef054cddmr19622657wmg.71.1649080524159; 
 Mon, 04 Apr 2022 06:55:24 -0700 (PDT)
Received: from localhost (static-114-163-6-89.ipcom.comunitel.net.
 [89.6.163.114]) by smtp.gmail.com with ESMTPSA id
 h5-20020a5d5485000000b002060e2f1607sm3994172wrv.40.2022.04.04.06.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:55:23 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
In-Reply-To: <YkrogEItLOGcuDwv@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 4 Apr 2022 13:45:52 +0100")
References: <20220329152123.493731-1-iii@linux.ibm.com>
 <YkrUbt8Z+N5uenDT@work-vm> <YkrogEItLOGcuDwv@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 04 Apr 2022 15:55:22 +0200
Message-ID: <875ynpc5rp.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 f.ebner@proxmox.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, s.reiter@proxmox.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, peterx@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, Christian Borntraeger <borntraeger@linux.ibm.com>,
 jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Mon, Apr 04, 2022 at 12:20:14PM +0100, Dr. David Alan Gilbert wrote:
>> * Ilya Leoshkevich (iii@linux.ibm.com) wrote:
>> > zlib_send_prepare() compresses pages of a running VM. zlib does not
>> > make any thread-safety guarantees with respect to changing deflate()
>> > input concurrently with deflate() [1].
>> >=20
>> > One can observe problems due to this with the IBM zEnterprise Data
>> > Compression accelerator capable zlib [2]. When the hardware
>> > acceleration is enabled, migration/multifd/tcp/zlib test fails
>> > intermittently [3] due to sliding window corruption.
>> >=20
>> > At the moment this problem occurs only with this accelerator, since
>> > its architecture explicitly discourages concurrent accesses [4]:
>> >=20
>> >     Page 26-57, "Other Conditions":
>> >=20
>> >     As observed by this CPU, other CPUs, and channel
>> >     programs, references to the parameter block, first,
>> >     second, and third operands may be multiple-access
>> >     references, accesses to these storage locations are
>> >     not necessarily block-concurrent, and the sequence
>> >     of these accesses or references is undefined.
>> >=20
>> > Still, it might affect other platforms due to a future zlib update.
>> > Therefore, copy the page being compressed into a private buffer before
>> > passing it to zlib.
>>=20
>> While this might work around the problem; your explanation doesn't quite
>> fit with the symptoms; or if they do, then you have a separate problem.
>>=20
>> The live migration code relies on the fact that the source is running
>> and changing it's memory as the data is transmitted; however it also
>> relies on the fact that if this happens the 'dirty' flag is set _after_
>> those changes causing another round of migration and retransmission of
>> the (now stable) data.
>>=20
>> We don't expect the load of the data for the first page write to be
>> correct, consistent etc - we just rely on the retransmission to be
>> correct when the page is stable.
>>=20
>> If your compressor hardware is doing something undefined during the
>> first case that's fine; as long as it works fine in the stable case
>> where the data isn't changing.
>>=20
>> Adding the extra copy is going to slow everyone else dowmn; and since
>> there's plenty of pthread lockingin those multifd I'm expecting them
>> to get reasonably defined ordering and thus be safe from multi threading
>> problems (please correct us if we've actually done something wrong in
>> the locking there).
>>=20
>> IMHO your accelerator when called from a zlib call needs to behave
>> the same as if it was the software implementation; i.e. if we've got
>> pthread calls in there that are enforcing ordering then that should be
>> fine; your accelerator implementation needs to add a barrier of some
>> type or an internal copy, not penalise everyone else.
>
> It is reasonable to argue that QEMU is relying on undefined behaviour
> when invoking zlib in this case, so it isn't clear that the accelerator
> impl should be changed, rather than QEMU be changed to follow the zlib
> API requirements.=20

It works on all the other cases.  My vote if need taht is that we add a
zlib-sync or similar method.
zlib already means doing a copy, doing an extra copy will cost too much
on my opinion.

Once that we are here, is there such a requirement for zstd?  In my
testing, zstd was basically always better than zlib (no, I don't
remember the details).

Later, Juan.


