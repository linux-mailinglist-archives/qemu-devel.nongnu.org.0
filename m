Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E0C69C79D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2NN-0007hs-7O; Mon, 20 Feb 2023 04:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU2Ml-0006hX-C5
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU2Mi-0005U9-Na
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676884894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aM+9qdfYeaQgZV1mMl6MBJgeYU7a4b40TFO12f06g+w=;
 b=LP48O+agkfzYGjbh1EMCWJKVVnzQN0S6c7nVXZlMsgYz/e87An+ODEdKykw3EGqqsmKM+9
 pmT7QoO7MQmQsbVdvWJUfbcJfpwzIT0i7KcVg31Ckf3TU0BiTtifygeNDU2/2WJ4SKaXwV
 /JN5R8OjiivtX2PCSMewGkiWZTVp8Ug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-cyIx9jlsOQ2FrC4E5VxbnA-1; Mon, 20 Feb 2023 04:21:30 -0500
X-MC-Unique: cyIx9jlsOQ2FrC4E5VxbnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65766185A794;
 Mon, 20 Feb 2023 09:21:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 444041415113;
 Mon, 20 Feb 2023 09:21:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40DC821E6A1F; Mon, 20 Feb 2023 10:21:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,  John
 Snow <jsnow@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro
 support policy
References: <20230217132631.403112-1-thuth@redhat.com>
 <Y++X2XtyfJEIzcln@redhat.com>
 <b2b54f1a-735c-acab-bd75-3d8cce9fb34d@redhat.com>
Date: Mon, 20 Feb 2023 10:21:29 +0100
In-Reply-To: <b2b54f1a-735c-acab-bd75-3d8cce9fb34d@redhat.com> (Thomas Huth's
 message of "Fri, 17 Feb 2023 19:30:05 +0100")
Message-ID: <87ilfwzo86.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> On 17/02/2023 16.06, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Feb 17, 2023 at 02:26:31PM +0100, Thomas Huth wrote:
> ...
>> I'm also not so comfortable dropping the only version of SLES that we
>> explicitly target, when we don't know when their new major release
>> will arrive.
>
> Let's hope that the next major version will show up at least five
> years after the previous one ... but what if it takes many more years?
> Do we want to support very old long term distros for "almost forever"?
>
> Also, should we maybe at least limit the time to 5 years? Otherwise,
> if openSUSE 16 gets released 5 years after v15, we have to support v15
> for 7 years in total due to the "two more years" rule...

Let's keep in mind that "2 years after the new major version" isn't the
law, it's a rule we give ourselves so we don't have to debate from first
principles every time.  If supporting a major version of SLES (or
anything for that matter) according to the rule becomes too expensive,
we can and should change the rule.

>> If we allow compilers, libraries to be bumped, then someone stuck on
>> RHEL-8 has a significant task to build their own toolchain/libraries
>> in order to work with QEMU still. If we only allow python modules to
>> be bumped, the solution is just a pip install / virtualenv away.
>
> Honestly, being a Python ignorant, I'm more comfortable with
> "./configure && make && make install" instead of messing up my system
> with pip like I did in the past ... but I guess it's ok if it is
> properly done automatically under the hood with a venv ... I'll get
> used to it ;-)

"pip in venv" should not mess up your system.

Automation is of course welcome, and likely to reduce mess-ups through
incorrect use / non-use of venvs.

Optional dependencies default to off when not satisfied.  Without
automation, satisfying them is up to the developer.  When you're not
hacking on Python code yourself, there is no need for you to satisfy the
mypy dependency, be it with dnf, pip, or whatever.

I believe the one Python-related dependency of general interest right
now is Sphinx, which is required for building documentation.


