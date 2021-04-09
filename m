Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC93591E5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 04:15:47 +0200 (CEST)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUggT-0004rI-Ry
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 22:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kernellwp@gmail.com>)
 id 1lUgfN-0004RP-8m
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 22:14:37 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kernellwp@gmail.com>)
 id 1lUgfH-0006UO-V7
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 22:14:36 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so4326542oto.2
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 19:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXmJQ1AQ2dRLJ4BxuERMk4u8MbmU3jknhUZiqY1lU/Q=;
 b=DTIkRQpR73KkDZBJlGU97X8eDtqylL6AGiQOOoeDgZcb5WcTxmNNZIw0z0TJy+GHCy
 WDfzAfiRT1ssFIb43yj0mOciKngoXBP4SgV4mIZR3yDFNKlxVBgtZ/e7HvXrcMRwg/9Y
 dOasV7mDxdTcf1PG9Y+GImNzcdnwx9R5ZKOE3ghGbLHixviFyNav5oX+YyMliFIVW/nU
 OsJju4ipGuHl+gcZWZnezkkjmgBhPL9gstF1wc4uDurM9qQGMzgx1mpMk1n1RZYJsew5
 fJ1KF4hAeXKwN0gUr7xgtmxLzXOF+Pih46HvgFv5GCE+EW+dj2K7grBipw/bNI1WwSY2
 /5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXmJQ1AQ2dRLJ4BxuERMk4u8MbmU3jknhUZiqY1lU/Q=;
 b=UMLcViWX+lOvaM0dr7V6Aws9KroNQkJ27CEhCGG63dV1SsDt10oW08pYLNTCqk5WDk
 +5N8qXW/Ee2W/eMrTvpy5BsRjAELaExmb4rrH3mD8hZKsEa/ILp56cIXAlV+t8dwcRxT
 jDeCq01JCgB4nxo/WMsAdwadylTagZO0PF1V3yniZUjssohfOKkcn9hSEaYzh/+7+Wte
 jH8iCQJm5cJBAajSn3a68TsUnTqPnDbeDg868FAWTZIEpWepisZixxQKGEVwN1WuVzDD
 29QT52KibUXpTZTlDaY99QX0ejHCeQjXpqfijqpko4Zplggf6OxzXxGVyffGo9MnnLkQ
 0PHg==
X-Gm-Message-State: AOAM531jprnLuNIydJq7pBW6yG4jCk239AehqkuQwrmG/jzTSffVMFbm
 w+7kzhUthVRb+zoWBfLJFuFyAstcv3pw2zemerc=
X-Google-Smtp-Source: ABdhPJwgM8xvPK7XoMLDwmCEzPt1KNcZ9oblpitnqOqMICSSQdtqJKbLXcogRDAU9M8eU+rxfQUTXRelLzpiOyVtp+Q=
X-Received: by 2002:a9d:470b:: with SMTP id a11mr9961591otf.254.1617934469962; 
 Thu, 08 Apr 2021 19:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <YGzW/Pa/p7svg5Rr@google.com>
 <874kgg29uo.ffs@nanos.tec.linutronix.de>
In-Reply-To: <874kgg29uo.ffs@nanos.tec.linutronix.de>
From: Wanpeng Li <kernellwp@gmail.com>
Date: Fri, 9 Apr 2021 10:14:18 +0800
Message-ID: <CANRm+Cz4FGBOEYOc9grx76pUT8uVbPDgbvqnDiZV42LQB8GQ_A@mail.gmail.com>
Subject: Re: Commit "x86/kvm: Move context tracking where it belongs" broke
 guest time accounting
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=kernellwp@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sean Christopherson <seanjc@google.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 at 21:19, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Apr 06 2021 at 21:47, Sean Christopherson wrote:
> > On Tue, Apr 06, 2021, Michael Tokarev wrote:
> >> broke kvm guest cpu time accounting - after this commit, when running
> >> qemu-system-x86_64 -enable-kvm, the guest time (in /proc/stat and
> >> elsewhere) is always 0.
> >>
> >> I dunno why it happened, but it happened, and all kernels after 5.9
> >> are affected by this.
> >>
> >> This commit is found in a (painful) git bisect between kernel 5.8 and 5.10.
> >
> > Yes :-(
> >
> > There's a bugzilla[1] and two proposed fixes[2][3].  I don't particularly like
> > either of the fixes, but an elegant solution hasn't presented itself.
> >
> > Thomas/Paolo, can you please weigh in?
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=209831
> > [2] https://lkml.kernel.org/r/1617011036-11734-1-git-send-email-wanpengli@tencent.com
> > [3] https://lkml.kernel.org/r/20210206004218.312023-1-seanjc@google.com
>
> All of the solutions I looked at so far are ugly as hell. The problem is
> that the accounting is plumbed into the context tracking and moving
> context tracking around to a different place is just wrong.
>
> I think the right solution is to seperate the time accounting logic out
> from guest_enter/exit_irqoff() and have virt time specific helpers which
> can be placed at the proper spots in kvm.

Good suggestion, I will have a try. :)

    Wanpeng

