Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60409665B09
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 13:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFZu3-00084d-K5; Wed, 11 Jan 2023 07:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1pFZtx-00082f-1r; Wed, 11 Jan 2023 07:08:20 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1pFZtu-00053Z-Av; Wed, 11 Jan 2023 07:08:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B4A847FD;
 Wed, 11 Jan 2023 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673438886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OR3He0NQHqUZ71pQDPF0fMGBuClDLcbxvhTMHf2g0I=;
 b=sbTaLm50Rsh5Mv0il7T7jySdjvRisyGi14jR0VN/Xm7CrKiz+LBtQcthYbL+L+oR1Re035
 F0iFoT02RFzWIoGcnIMcqmf/8YFSWc4j3Fy5DTNAwmbmi0FJ/Dfo963YnGnJln+oUUXT8d
 eFEQImT62W/lcf5x7FQAvR2zV5wthAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673438886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OR3He0NQHqUZ71pQDPF0fMGBuClDLcbxvhTMHf2g0I=;
 b=0kETKk1rKQ6k/+dAAEEtmE5Odyyby8CgUVbRjYFwJ1SDJTDyQ/ZG3DWNmiko3ZkxH01wwj
 rHP9SAq+QK4P9zBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFA201358A;
 Wed, 11 Jan 2023 12:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0VNDKaWmvmP8PQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 11 Jan 2023 12:08:05 +0000
Message-ID: <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
Date: Wed, 11 Jan 2023 13:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 1/10/23 15:02, Peter Maydell wrote:
> On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>>>
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> On 09/01/2023 23.42, Fabiano Rosas wrote:
>>>>>> From: Claudio Fontana <cfontana@suse.de>
>>>>>>
>>>>>> on ARM we currently list and build all machines, even when
>>>>>> building KVM-only, without TCG.
>>>>>>
>>>>>> Until we fix this (and we only list and build machines that are
>>>>>> compatible with KVM), only test specifically using the "virt"
>>>>>> machine in this case.
>>>>>
>>>>> Why don't you fix it immediately? ...
>>>>
>>>> My idea was to have in this series the minimum to unbreak the
>>>> --disable-tcg build and later bring the rest of the changes
>>>> incrementally.
>>>
>>> This test is basically checking "all the machines should
>>> work". That's an important invariant to maintain, so
>>> I don't think we should just skip it for Arm targets.
>>
>> But what does "all machines" mean in a no-TCG build? The original intent
>> of the patch was that only 'virt' should be present and therefore the
>> only one tested.
> 
> It means "every machine the user can create". If the
> machine can't run then either we shouldn't compile it
> in, or else we should be compiling in enough extra stuff
> to allow it to work.
> 
> -- PMM

Hi,

once upon a time there was a series by Philippe to accomplish that (KConfig) right?

Ciao,

Claudio







