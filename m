Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F233F69A7DA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 10:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSwho-0001Od-G7; Fri, 17 Feb 2023 04:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSwhm-0001Nx-Cu
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 04:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSwhk-0005RC-EI
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 04:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676624815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0N7zx6sdtNUG5TdFijJcQM29VpdGP4bpD4qhxHcXZYw=;
 b=fbFYFevTLRMWG+5Nfti5Y1LpgmYAhzEHfmjP/EPC8SJmRkgV+S8ud2tbKP+nNGUX6YZ41H
 Gyo0cTGWp6La0aUeOnP/hSejp6FgQ0o/dGmNBQOFcYS6KYtdLkjeBauHh5r8HbUY91eE3I
 AZ8+G2xpGmqmDaedqYXq0LL4b18B5ns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-7QdsG3xyM-a7cxtHl_E5KQ-1; Fri, 17 Feb 2023 04:06:51 -0500
X-MC-Unique: 7QdsG3xyM-a7cxtHl_E5KQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1B32100802C;
 Fri, 17 Feb 2023 09:06:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D3A1121314;
 Fri, 17 Feb 2023 09:06:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3EC1621E6A1F; Fri, 17 Feb 2023 10:06:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  John Snow <jsnow@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Cleber Rosa <crosa@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Daniel Berrange
 <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-block@nongnu.org,  Hanna Reitz
 <hreitz@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
Date: Fri, 17 Feb 2023 10:06:49 +0100
In-Reply-To: <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com> (Thomas Huth's
 message of "Thu, 16 Feb 2023 11:58:46 +0100")
Message-ID: <87zg9cirti.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Thomas Huth <thuth@redhat.com> writes:

> On 15/02/2023 20.05, Markus Armbruster wrote:
>> The discussion under PATCH 6 makes me think there's a bit of confusion
>> about the actual impact of dropping support for Python 3.6.  Possibly
>> because it's spelled out in the commit message of PATCH 7.  Let me
>> summarize it in one sentence:
>> 
>>      *** All supported host systems continue to work ***
>> 
>> Evidence: CI remains green.
>
> The CI remains green since one of the patches disabled the building of the 
> docs on CentOS 8. That's not how I'd describe "continue to work", at least 
> not in the same extend as before.

Thus the exception ...

>> On some supported host systems, different packages need to be installed.
>> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
>> instead of 3.6.8.  Let me stress again: same repository, different
>> package.  No downsides I can see.

... right here:

>> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
>> version of Sphinx that works with Python 3.7 or newer.  This series
>> proposes to simply stop building the docs there, unless the user
>> provides a suitable version of Sphinx (which is easy enough with pip).
>
> I think we've all understood that. The thing that you obviously did not 
> understood: This breaks our support statement.
> I'm pretty sure that you could also build the whole QEMU suite successfully 
> on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a 
> newer version of GCC and some of the required libraries first. But that's 
> not how we understand our support statement.
>
> Sure, you can argue that you can use "pip install" to get a newer version of 
> Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is 
> that really that much different from installing a newer version of GCC and 
> libraries on an ancient distro that we do not officially support anymore? 
> I'd say no. You also have to consider that not every build host has access 
> to the internet, maybe some companies only have an internal mirror of the 
> distro packages in their intranet (I remember some discussion about such a 
> case in the past) - so while you were perfectly fine to build the whole of 
> QEMU on a CentOS 8 there before this change, you could now not build parts 
> of QEMU anymore there due to the missing possibility to run "pip install" 
> without full internet connection.
>
> And sure, you can argue that it's "just" the documentation. But IMHO that's 
> still an essential part of the QEMU build, and it used to work before, so it 
> feels wrong to cut that now out. And also, if we start with the 
> documentation now, what's next? If for example scripts/shaderinclude.py 
> stops working with Python 3.6, do we then simply say: "Oh, it's fine, you 
> can still build all the other targets that work without this script, just 
> not the ones anymore that need it"?

My view on all this is a bit more pragmatic.

For a human developer, the difference between "dnf install
python-sphinx" and "pip install sphinx" is, in my opinion, close to
negligible.  Really no comparison to "git-clone GCC and bootstap it".
You seem to disagree with that.

For automated builds in general, and distro packaging in particular, the
difference is real, and could even be a show stopper.  But who's
packaging bleeding edge QEMU on CentOS 8?  I suspect the only automated
builds are our own CI, where the difference is real, but hardly a show
stopper.  John's patch is the stupidest solution that could possibly
work for us: disable doc building on CentOS 8.  Alternative solutions
have been proposed, and that's fair.  Again, you seem to think this
issue is a lot more serious.

So maybe this breaks our support statement for a sufficiently rigid
interpretation of our support statement.  Not the way interpreted it,
but if it's the way it is to be interpreted, I stand corrected.

But then I'd like us to be a bit more pragmatic.  Is minor and graceful
degradation for systems close to the trailing edge really so
unacceptably terrible that we have to bend over backwards to avoid it?

>> All the angst about CentOS falling off the end of our "supported build
>> platforms" list is not actually warranted by this series :)
>
> Using the term "angst" for the concerns of your fellows here is quite 
> cheeky. It's not about "angst", it's about a discussion that our support 
> policy might need to be adjusted if we do this step. So instead of writing 
> such sentences, I'd rather would like to see you posting a patch for 
> docs/about/build-platforms.rst for constructive further discussion instead.

The phrasing of this sentence was ill-advised.  If it caused offense, I
apologize.


