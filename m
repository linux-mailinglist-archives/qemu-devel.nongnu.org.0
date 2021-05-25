Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72D390C08
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 00:17:29 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llfMd-0000DO-S7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 18:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llfLS-0007yH-8y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llfLO-0003bb-KE
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621980967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzlw5PIqtnqNrt6yD0QxwjAkdrTyeWv3jxwiOOkpVdE=;
 b=LjAeMzwc+iTxcgrvXTaklsS79wJPJbWte46tZKU+fUKBzSutZvAkViKFKZi2vgiMiBS6qR
 lT3QV+Iv5rik7MzVGgPMtUEAbiYETPwByUkqcCkVW1rTDm/GAN9VDsDjg5/cvVf9ZA9NTX
 c9/Q4NCVDLnHmTDhOHJOST1vbBohhms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-1LMnGjjmPgKunQPH48l1Iw-1; Tue, 25 May 2021 18:16:05 -0400
X-MC-Unique: 1LMnGjjmPgKunQPH48l1Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00155501E3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 22:16:04 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8780A2BFE9;
 Tue, 25 May 2021 22:16:03 +0000 (UTC)
Subject: Re: [PATCH v6 25/25] python: add tox support
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-26-jsnow@redhat.com>
 <YK1ayNF0VTSJKa6O@localhost.localdomain>
 <9a50d093-9eea-850c-3d5d-bd44b0f45551@redhat.com>
 <20210525204649.GH1567491@amachine.somewhere>
From: John Snow <jsnow@redhat.com>
Message-ID: <22819eb3-5254-a8e0-ece2-f9af4c72d5f4@redhat.com>
Date: Tue, 25 May 2021 18:15:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525204649.GH1567491@amachine.somewhere>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 4:46 PM, Cleber Rosa wrote:
> On Tue, May 25, 2021 at 04:25:37PM -0400, John Snow wrote:
>> On 5/25/21 4:15 PM, Cleber Rosa wrote:
>>> On Wed, May 12, 2021 at 07:12:41PM -0400, John Snow wrote:
>>>> This is intended to be a manually run, non-CI script.
>>>>
>>>> Use tox to test the linters against all python versions from 3.6 to
>>>> 3.9. This will only work if you actually have those versions installed
>>>> locally, but Fedora makes this easy:
>>>>
>>>>> sudo dnf install python36 python37 python38 python39
>>>>
>>>> Unlike the pipenv tests (make venv-check), this pulls "whichever"
>>>> versions of the python packages, so they are unpinned and may break as
>>>> time goes on. In the case that breakages are found, setup.cfg should be
>>>> amended accordingly to avoid the bad dependant versions, or the code
>>>> should be amended to work around the issue.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    python/README.rst |  2 ++
>>>>    python/.gitignore |  1 +
>>>>    python/Makefile   |  7 ++++++-
>>>>    python/setup.cfg  |  1 +
>>>>    python/tox.ini    | 13 +++++++++++++
>>>>    5 files changed, 23 insertions(+), 1 deletion(-)
>>>>    create mode 100644 python/tox.ini
>>>>
>>>
>>> This works as intended for me.  A couple of notes / suggestions
>>> for future improvements:
>>>
>>>    * `dnf install tox` pulled all the Python versions available (I
>>>      assume as suggestions) automatically
>>>
>>>    * tox.ini can be folded into setup.cfg
>>>
>>
>> Done!
>>
> 
> Nice!
> 
>>>    * a custom container image with all those Python versions may be
>>>      handy for running both the pipenv based job (along with the
>>>      suggestions on the previous patch) and an on-demand,
>>>      "allow_failure" tox based CI job.
>>>
>>
>> Yeah, I was thinking this would be good, too!
>>
>> I think at this point, it's going to be a follow-up, though. Because
>> ideally, yes, this SHOULD pass -- it's just that it needs a fairly
>> particular environment to run in, which is annoying, so it's here as an
>> optional-ish thing for now.
>>
>> Maybe I'll make a new fedora:latest container that's meant solely for
>> testing python stuff, because it's just such a convenient distro for it.
>>
>> Later, though.
>>
> 
> Sure.
> 
>>> Other than those suggestions, this LGTM!
>>>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>> Tested-by: Cleber Rosa <crosa@redhat.com>
>>>
>>
>> 🎉
> 
> \o/ (with 3 characters, because I'm unable to find the right codepoint)
> 

if you're on fedora using the ime-bus stuff, try ctrl+shift+e to enter 
EMOJI MODE and then type 'tada' and then hit 'space' to search.

🥳


