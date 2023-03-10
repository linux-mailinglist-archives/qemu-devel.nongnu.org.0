Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8A6B4DF9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:07:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagBp-0005IG-9x; Fri, 10 Mar 2023 12:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pagBS-0005Hu-PC; Fri, 10 Mar 2023 12:05:36 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pagBQ-00074l-Jh; Fri, 10 Mar 2023 12:05:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BAFE320660;
 Fri, 10 Mar 2023 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678467929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVAncZNqBk0mUyNzcMeXhZeJGn2eDOMqwSw7/zsFTrw=;
 b=E1WgNLyhN6OVC/xv3sWK7opWClOISjb7MVWQ2PzCWEmaVtKxyFvfPQyz1Y876VD2yjbVTc
 BklwJAD6ebHrtotQtRj3s/3wf+Bf+DwleuZDXYAEmgX0M07VYjmJKbLQVBmL8BEb9Mt+e+
 rMai62YuHKai3ad13AoAEZWREh7yq04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678467929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVAncZNqBk0mUyNzcMeXhZeJGn2eDOMqwSw7/zsFTrw=;
 b=UkJIuEqkuchUa8hY2PWuCy5IQmTsFm3ABRqbZh5h+/OXzcYUHyMPJJlyQGUv8AQWKetgBV
 WqrfA/SlaqdNi0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D11B13592;
 Fri, 10 Mar 2023 17:05:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FSO4AVljC2Q5NwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 17:05:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <dc35fc70-c609-09db-15f1-e59933cb1afd@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
 <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com> <877cvoehxo.fsf@suse.de>
 <dc35fc70-c609-09db-15f1-e59933cb1afd@redhat.com>
Date: Fri, 10 Mar 2023 14:05:26 -0300
Message-ID: <87zg8kczah.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Thomas Huth <thuth@redhat.com> writes:

> On 10/03/2023 16.37, Fabiano Rosas wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> On 10/03/2023 14.06, Fabiano Rosas wrote:
>>>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>>>
>>>>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>>>> host.
>>>>>>
>>>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>>>
>>>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>>>> test cases if TCG and KVM are missing.
>>>>>>
>>>>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>>>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>>>>> printed before other messages") to avoid TAP parsing errors.
>>>>>>
>>>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>>>
>>>>> I don't like it that we are hard-coding the list of accelerators
>>>>> like this. Make a wrapper?
>>>>>
>>>>
>>>> Are you thinking of some sort of "has_any_accel" wrapper?
>>>
>>> I think in the long run, we want something like what I described here:
>>>
>>> https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/
>>>
>> 
>> Wont't that function be too generic? The choice of accelerator is quite
>> specific to each individual test, some might not work with TCG, some
>> might not work with HVF and so on. There is no link between build-time
>> configuration and runtime test execution after all. We could always have
>> a build without an accelerator and then try to run a test that uses that
>> accelerator. And also have an accelerator present that the test does not
>> support at all.
>> 
>> 
>> For this particularly bizarre case of not having TCG nor KVM in the
>> build I'm inclined to go with Michael's suggestion of checking it at
>> build time and skipping all the hassle. This is what I'm preparing:
>> 
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 29a4efb4c2..e698cdcb60 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -27,6 +27,12 @@ if config_host.has_key('CONFIG_MODULES')
>>     qtests_generic += [ 'modules-test' ]
>>   endif
>>   
>> +# For x86_64, i386 and aarch64 it is possible to have only Xen as an
>> +# accelerator. Some tests require either TCG or KVM, so make sure they
>> +# are present before building those tests.
>> +tcg_or_kvm_available = (config_all.has_key('CONFIG_TCG') or
>> +                        config_all.has_key('CONFIG_KVM'))

Ouch, this doesn't work because one of the binaries could still have KVM
support and we build the tests only once.

On an aarch64 host:
---disable-tcg --enable-kvm --enable-xen =>
qemu-system-aarch64 w/ Xen, KVM, no TCG
qemu-system-x86_64  w/ Xen, no KVM, no TCG

