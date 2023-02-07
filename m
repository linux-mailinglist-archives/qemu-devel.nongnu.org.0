Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B755D68E2EC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVRO-0006hC-PM; Tue, 07 Feb 2023 16:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPVRN-0006h4-3T
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:23:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPVRL-0004XB-Cw
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675805026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P1z8JGvYMIdywjsUQkiTU2941tLmITGbe3Q90CHys28=;
 b=iY9ou3Hoa5n+Ovw/3SQmwTw5biBiIrSaA4KSi8ED6u/d06IUweDOyLCViKSFJlLRaTapyJ
 p6m5PgZzm5d/Whjelkc8YbRwZ3AieJwCb5u9NTyfdrGRTl2zuT5zhCOpHqySYtjMjsuPF7
 uqnNagM/SkIpgB2SQ2W0hg1OhwW+brQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-Ahk2MHbIO2ar5Q-KYNn8dQ-1; Tue, 07 Feb 2023 16:23:44 -0500
X-MC-Unique: Ahk2MHbIO2ar5Q-KYNn8dQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 i3-20020a170902cf0300b00198bc9ba4edso8825220plg.21
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 13:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1z8JGvYMIdywjsUQkiTU2941tLmITGbe3Q90CHys28=;
 b=IIk7CDz/Qd8+LKpYqgVpeMIqw4r4M1vj/YSuuc+CYcfkduixEbr/gpte+5UKZ9T97V
 buhKvTkFuKGFtxYu5VcyfLSmHamhjZrPCs9RDe9A8UDrF22C3gxOBgvDt5/JedH0om4u
 j74qvarj3iY0xs0wh0dQmC7Ep8LqAaKUUDQvnLzp6ASzqSwmdtuv5sD0pD1OfYxRdSj/
 FqoBkBH2lbUrilUsb1cRXwQyjXW8JrLL5CQ9GO7ULx8Hyx7T9EM8PruM0j2fBwyWQrjy
 mXx67SLLcvWfNkht1PMS/EZmcID8/G5+ZXF/tWSWb98/DXMtOlfyJe2Gf1yYkVkX3Vll
 dAyA==
X-Gm-Message-State: AO0yUKUe0m4je25qRvNYCMWwI6OwN+4ybPPVJDnBEryLysr9RU7yKeJi
 b509OvTD2aOwpe0iarqFQxLjCPuXV3mKOiThU2YBTr74OpAruPmdDE3gucNy2GswXX2r0uAD93a
 Ax7U0GZtt+okNHocZhP5o4QbdFTZWYEs=
X-Received: by 2002:a17:90a:e281:b0:230:3649:a362 with SMTP id
 d1-20020a17090ae28100b002303649a362mr70512pjz.131.1675805023671; 
 Tue, 07 Feb 2023 13:23:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9fbgEt/aEm3ICdbJEBSZkhKHodNPDTmC6O4Ee4la5CV2PjbxgJEC8WhFD40QE3DV82WxmvtVoG9+USQ00oiog=
X-Received: by 2002:a17:90a:e281:b0:230:3649:a362 with SMTP id
 d1-20020a17090ae28100b002303649a362mr70504pjz.131.1675805023357; Tue, 07 Feb
 2023 13:23:43 -0800 (PST)
MIME-Version: 1.0
References: <1675796605-235646-1-git-send-email-steven.sistare@oracle.com>
 <CAFn=p-ZCA42VAMEkg8xQeTQBTMqn1AA7RjptkWD72uwBX+iKPA@mail.gmail.com>
 <020941fe-f01f-ed97-6fd1-9ad217c698eb@oracle.com>
In-Reply-To: <020941fe-f01f-ed97-6fd1-9ad217c698eb@oracle.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 7 Feb 2023 16:23:32 -0500
Message-ID: <CAFn=p-YMhJVfjUSUHiEhomkKBKM6LfLB=TXn+ii7n=cWwvyAKg@mail.gmail.com>
Subject: Re: [PATCH V2] python/machine: QEMUMachine reopen_qmp_connection
To: Steven Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 7, 2023 at 4:04 PM Steven Sistare <steven.sistare@oracle.com> wrote:
>
> On 2/7/2023 3:28 PM, John Snow wrote:
> > On Tue, Feb 7, 2023 at 2:03 PM Steve Sistare <steven.sistare@oracle.com> wrote:
> >>
> >> Provide reopen_qmp_connection() to reopen a closed monitor connection.
> >> This will be needed by cpr, because qemu exec closes the monitor socket.
> >>
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >> Reviewed-by: John Snow <jsnow@redhat.com>
> >> ---
> >>  python/qemu/machine/machine.py | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> >> index ef94dcf..557209a 100644
> >> --- a/python/qemu/machine/machine.py
> >> +++ b/python/qemu/machine/machine.py
> >> @@ -501,6 +501,16 @@ def _close_qmp_connection(self) -> None:
> >>          finally:
> >>              self._qmp_connection = None
> >>
> >> +    def reopen_qmp_connection(self) -> None:
> >> +        """Close and re-open the QMP connection."""
> >> +        self._close_qmp_connection()
> >> +        self._qmp_connection = QEMUMonitorProtocol(
> >> +            self._monitor_address,
> >> +            server=True,
> >> +            nickname=self._name
> >> +        )
> >> +        self._qmp.accept(self._qmp_timer)
> >> +
> >>      def _early_cleanup(self) -> None:
> >>          """
> >>          Perform any cleanup that needs to happen before the VM exits.
> >> --
> >> 1.8.3.1
> >>
> >
> > This code is still mechanically fine as far as I can tell, but I lost
> > the plot on why it's needed - Can you please elaborate for me on what
> > you mean by "qemu exec will close the socket"?
> >
> > (R-B still stands, but since I am rewriting machine.py to be natively
> > async, I should be aware of your new use case.)
>
> Sure, thanks for asking.
>
> During cpr (aka live update), the old qemu process directly execv's the new
> qemu binary.  The monitor socket fd is marked cloexec, so the kernel closes it
> during execv.
>
> - Steve

Oho, I see.

I wonder if you are helped at all by some of Marc-Andre's recent
changes to use socketpair() for QMP connections with machine.py.
Depending on how those sockets are managed, it might be possible to
hold onto one of them without having it closed alongside the old QEMU
process. Or, if that doesn't help, double-check that it doesn't *hurt*
you either. It should be the default as of about a week ago now --
instead of using a local unix socket, we use socketpair and pass the
FD to help alleviate some race conditions.

(Again, I'm fine with this patch either way, just a heads up.)

--js


