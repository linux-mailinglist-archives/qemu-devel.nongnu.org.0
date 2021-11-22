Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B2458BC8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:53:06 +0100 (CET)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp60X-0007YO-GS
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp5z0-0006Bi-2N
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:51:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp5yv-0000ql-PT
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637574683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxWpdfRfeTPZ7OTlLjgVqKZVnkVusRDzYBtnUSvflS8=;
 b=P12zzEbd3zZtZdcqIpPDYHJVi6X2ahxVhcye9eLrtWRvc1C7GaTTBNmM+eCp//umDvWcFC
 g+rmT+UqcJ/a1BlVfsCyUVqBKdrbB0Z6uIeyeBYIi6GR9k02LQoE0b+L+GDb/w568vozHv
 5U+Axx0XUb0JnFaa7YNe4PwrLxC1LKE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-PNruiztQOfyaAwfcWkKGsw-1; Mon, 22 Nov 2021 04:51:18 -0500
X-MC-Unique: PNruiztQOfyaAwfcWkKGsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso2963441wrw.10
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 01:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=sxWpdfRfeTPZ7OTlLjgVqKZVnkVusRDzYBtnUSvflS8=;
 b=MATNNRV8tPJyJCsQggBMzi85VyHlQAdyRFfLnR77J63Xq6U9JbNR8iv8lyd71msvPZ
 /kZtdqzJpVD7wIRrOBoDYsy8DD+A6i6iRgAkq/qperpNEtGNNeMI1JksJgRWvdHMTnox
 KeAydK0vCXx/Z2hnHIour/kJJKBUslTRFaBJgycZzaYk7iLRgKkcM0yzu7JYMr+hPuBC
 GSzUW/nfrC4rAegDloxpx2EZsDj9aes3klUjRFvV7p61W8qnmUjZXlrccuog2trA3arK
 V8r06jSqJPloY8UjgmX5seWzdZHY3sVT+nMM22dSjH9ujiI3+M6SJGvW16u5GDQst4t3
 XMQg==
X-Gm-Message-State: AOAM533WTojtZT69hZ3R02Hv5KvtEyHoFlL2L0zpksPFfulQurNkl06p
 zwodBC1soG03w45HGrdv3jzancMfqcp4FmUntue+/z+iPGWMJ0BylZNwFbZvQeJF2N/2ya7zYnd
 0i0U7Nb5FY1d+tT4=
X-Received: by 2002:a7b:c153:: with SMTP id z19mr27683672wmi.171.1637574677604; 
 Mon, 22 Nov 2021 01:51:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwodU7ZPuLXdviXxkwAMbXvlQFISDU7uA1KpTV1jr6CnL707GHvGY634LvtDKwsCKCc4jmFdg==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr27683632wmi.171.1637574677358; 
 Mon, 22 Nov 2021 01:51:17 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id t4sm20410219wmi.48.2021.11.22.01.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 01:51:16 -0800 (PST)
Message-ID: <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com>
Date: Mon, 22 Nov 2021 10:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
In-Reply-To: <20211119193118.949698-2-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 20.31, Kashyap Chamarthy wrote:
> I completely botched up the merged[0] rST conversion of this document by
> accidentally dropping entire hunks (!) of text. :-(  I made it very hard
> for reviewers to spot it, as the omitted text was buried deep in the
> document.  To fix my hatchet job, I reconverted the "SubmitAPatch"
> wiki[1] page from scratch and replaced the existing rST with it, while
> making sure I incorporated previous feedback.

Thanks for the quick update! I've now tripple-checked the differences 
between the old wiki page and the new rst page, and I think with some 
additional small changes on top (which I will do while picking up your 
patch, see below), we should be fine now.

[...]
> @@ -55,16 +55,15 @@ Writing your Patches
>   Use the QEMU coding style
>   ~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> -You can run run *scripts/checkpatch.pl <patchfile>* before submitting to
> -check that you are in compliance with our coding standards. Be aware
> -that ``checkpatch.pl`` is not infallible, though, especially where C
> +You can run run *scripts/checkpatch.pl <patch file>* before submitting
> +to check that you are in compliance with our coding standards. Be aware
> +that checkpatch.pl is not infallible, though, especially where C
>   preprocessor macros are involved; use some common sense too. See also:
>   
> -- `QEMU Coding Style
> -  <https://qemu-project.gitlab.io/qemu/devel/style.html>`__
> -
> +-  `QEMU Coding Style <https://qemu-project.gitlab.io/qemu/devel/style.html>`__

While we're at it, I'll replace the link with an internal link when picking 
up this patch (so that it can also be used in offline documentation).

>   -  `Automate a checkpatch run on
> -   commit <http://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
> +   commit <https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
> +-  Spell check your patches

I'll add the link to https://wiki.qemu.org/Contribute/SpellCheck again.

> @@ -85,7 +91,7 @@ Split up longer patches into a patch series of logical code changes.
>   Each change should compile and execute successfully. For instance, don't
>   add a file to the makefile in patch one and then add the file itself in
>   patch two. (This rule is here so that people can later use tools like
> -`git bisect <http://git-scm.com/docs/git-bisect>`__ without hitting
> +```git bisect`` <http://git-scm.com/docs/git-bisect>`__ without hitting

You've re-introduced the broken git-bisect link. I'll fix it again.

> @@ -170,11 +175,74 @@ displays the subject line some distance apart (that is, a body that
>   starts with "... so that" as a continuation of the subject line is
>   harder to follow).
>   
> +If your patch fixes a commit that is already in the repository, please
> +add a line with "Fixes: ("Fixed commit subject")" below the patch

Missing the "<at-least-12-digits-of-SHA-commit-id>" from the Wiki page. I'll 
add it.

> +description / before your "Signed-off-by:" line in the commit message.
> +
> +If your patch fixes a bug in the gitlab bug tracker, please add a line
> +with "Resolves: " to the commit message, too. Gitlab can close bugs

Missing the "<URL-of-the-bug>" from the Wiki. I'll add it.

> +automatically once commits with the "Resolved:" keyword get merged into
> +the master branch of the project. And if your patch addresses a bug in
> +another public bug tracker, you can also use a line with "Buglink: " for

dito.

> @@ -223,13 +291,22 @@ use --numbered so the cover and the patch have distinct subject lines).

I noticed that the --numbered will be translated into –numbered, so I'll add 
some `` quotes here.

> @@ -288,6 +370,18 @@ it's best to:
>      of the patchset you're looking for review on, and why reviewers
>      should care
>   
> +.. _consider_whether_your_patch_is_applicable_for_stable:
> +
> +Consider whether your patch is applicable for stable
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If your patch fixes a severe issue or a regression, it may be applicable
> +for stable. In that case, consider adding ``Cc: qemu-stable@nongnu.org``
> +to your patch to notify the stable maintainers.
> +
> +For more details on how QEMU's stable process works, refer to
> +`docs/devel/stable-process.rst <https://git.qemu.org/?p=qemu.git;a=blob_plain;f=docs/devel/stable-process.rst;hb=HEAD>`__.

While at this, I'll also replace this external link with an internal one.

>   Is my patch in?
>   ~~~~~~~~~~~~~~~
>   
> +QEMU has some Continuous Integration machines that try to catch patch
> +submission problems as soon as possible.  `patchew
> +<http://patchew.org/QEMU/>`__ includes a web interface for tracking the
> +status of various threads that have been posted to the list, and may
> +send you an automated mail if it detected a problem with your patch.
> +
>   Once your patch has had enough review on list, the maintainer for that
>   area of code will send notification to the list that they are including
>   your patch in a particular staging branch. Periodically, the maintainer
>   then sends a `pull request
>   <https://qemu-project.gitlab.io/qemu/devel/submitting-a-pull-request.html>`__

I'll also use an internal link for this reference here.

> -for aggregating topic branches into mainline qemu. Generally, you do not
> +for aggregating topic branches into mainline QEMU. Generally, you do not
>   need to send a pull request unless you have contributed enough patches
>   to become a maintainer over a particular section of code. Maintainers
>   may further modify your commit, by resolving simple merge conflicts or

  Thomas


