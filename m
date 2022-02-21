Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658A4BDAEB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:46:02 +0100 (CET)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBp1-00014T-Gx
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:45:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMBkq-00078F-U5
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMBko-00012n-A7
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645461697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=puzZA6bEcDbj5eMZXksTeLwId4z6N/efi5zgpQwqEQo=;
 b=bfsBWub5i2aJUicOd1XvP97Ampem6BOMKX8gRqE5VSAB1UdctoeHIsNW6GF5pJUwdS//5g
 kCmZCQkzdG6e0Wc7hRa4pwWNbm8Y3DwPbw3xA6CSJ32hId5PFMjG2tlocdiJIUe3+bGPd5
 /DNvf5N6TpmXPMNox5+LS8Gc1tBPUd4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-IKXlEZcfMf-a708oe_cjxQ-1; Mon, 21 Feb 2022 11:41:36 -0500
X-MC-Unique: IKXlEZcfMf-a708oe_cjxQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 q17-20020a2e7511000000b0023c95987502so4313831ljc.16
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=puzZA6bEcDbj5eMZXksTeLwId4z6N/efi5zgpQwqEQo=;
 b=rxr/95rvdE5Kn7kow6s/ICFfq+HqeqGzNgE2s1F0Cv7umfUY+N8iZR+51l25s44AKj
 VR/j9yiVLttrhniqsyBfjnTHy3T0uZlAUd+HCEaZHo1RQssT5kgYu6rh91UT9afy5Eul
 d8n2uySloJqAfsH6XQ+rCyXabC5ZPAiEPSG6XwMJogQ06ZSc53IhStlxQocvefE3ALHr
 eSWSrZKahoMDdY30wmGvv1oKeZNmbKQv6iAtWuvuNONZMC/sM2OUPiTPKaIknK4/V7Zs
 SFQscCa8dl9gRETIOd6UDLcB7sBp013+qmY8uPAmX99ed8MWlGNLPfK9sw8koLyAWsBp
 7rwQ==
X-Gm-Message-State: AOAM5302+5WrbhXRDWwFRHXhjlxXOJrQD8lLO+A4VECy30zY13EX4Pj4
 vlokyGTw1dcc6SHLpIFKGPH5ZvTHnlNENjnbqDBXRBDvBiDAMSGh4mKJyiCuhZFy5HyWVTa2tUL
 kjvN0uzt1JW1coMGMucKUaoBwXObUrCk=
X-Received: by 2002:a05:6512:3d90:b0:437:73cb:8e76 with SMTP id
 k16-20020a0565123d9000b0043773cb8e76mr14926328lfv.187.1645461694380; 
 Mon, 21 Feb 2022 08:41:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx01xrYftCwWBUx7ltlrHUnzCE/8pmBGxyxHuOQuzFIaPP5Sv+fS+RgI2lL0MR6PspEmkxQp/wPjFtKOdFhR5w=
X-Received: by 2002:a05:6512:3d90:b0:437:73cb:8e76 with SMTP id
 k16-20020a0565123d9000b0043773cb8e76mr14926308lfv.187.1645461694112; Mon, 21
 Feb 2022 08:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-2-leobras@redhat.com>
 <87v8xccet4.fsf@secure.mitica>
In-Reply-To: <87v8xccet4.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 21 Feb 2022 13:41:23 -0300
Message-ID: <CAJ6HWG6GkCUNQjfGEWm+p-c283=4vVQg8mbpVu9jfNEyfRMVPA@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for reviewing, Juan!

On Fri, Feb 18, 2022 at 1:36 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> wrote:
> > Add flags to io_writev and introduce io_flush as optional callback to
> > QIOChannelClass, allowing the implementation of zero copy writes by
> > subclasses.
> >
> > How to use them:
> > - Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
> > - Wait write completion with qio_channel_flush().
> >
> > Notes:
> > As some zero copy write implementations work asynchronously, it's
> > recommended to keep the write buffer untouched until the return of
> > qio_channel_flush(), to avoid the risk of sending an updated buffer
> > instead of the buffer state during write.
> >
> > As io_flush callback is optional, if a subclass does not implement it, then:
> > - io_flush will return 0 without changing anything.
> >
> > Also, some functions like qio_channel_writev_full_all() were adapted to
> > receive a flag parameter. That allows shared code between zero copy and
> > non-zero copy writev, and also an easier implementation on new flags.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> As everybody pointed out about the missing assertion...
>


