Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30B6C92FB
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 09:31:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgKpC-0007ZH-B3; Sun, 26 Mar 2023 03:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pgKp9-0007Z4-ME
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 03:29:55 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pgKp6-0005Nn-6q
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 03:29:55 -0400
HMM_SOURCE_IP: 172.18.0.218:59255.1827657580
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id B32932800CB;
 Sun, 26 Mar 2023 15:29:27 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0025 with ESMTP id 5e84a43ce8374f6499485ba72989706a for
 armbru@redhat.com; Sun, 26 Mar 2023 15:29:42 CST
X-Transaction-ID: 5e84a43ce8374f6499485ba72989706a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <333f094e-c009-4e61-22b4-3433d1291af4@chinatelecom.cn>
Date: Sun, 26 Mar 2023 15:29:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 06/10] migration: Introduce dirty-limit capability
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <cover.1676563222.git.huangy81@chinatelecom.cn>
 <a9952eaa2bf3c8066b0e8dee066b57395ffa37b1.1676563222.git.huangy81@chinatelecom.cn>
 <871qlepcw7.fsf@pond.sub.org>
 <f70dbc9b-e722-ad77-e22d-12c339f5ff4d@chinatelecom.cn>
 <87ttyamd8j.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87ttyamd8j.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2023/3/24 22:32, Markus Armbruster 写道:
> Hyman Huang <huangy81@chinatelecom.cn> writes:
> 
>> 在 2023/3/24 20:11, Markus Armbruster 写道:
>>> huangy81@chinatelecom.cn writes:
>>>
>>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>>
>>>> Introduce migration dirty-limit capability, which can
>>>> be turned on before live migration and limit dirty
>>>> page rate durty live migration.
>>>>
>>>> Introduce migrate_dirty_limit function to help check
>>>> if dirty-limit capability enabled during live migration.
>>>>
>>>> Meanwhile, refactor vcpu_dirty_rate_stat_collect
>>>> so that period can be configured instead of hardcoded.
>>>>
>>>> dirty-limit capability is kind of like auto-converge
>>>> but using dirty limit instead of traditional cpu-throttle
>>>> to throttle guest down. To enable this feature, turn on
>>>> the dirty-limit capability before live migration using
>>>> migrate-set-capabilities, and set the parameters
>>>> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
>>>> to speed up convergence.
>>>>
>>>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>> Acked-by: Peter Xu <peterx@redhat.com>
>>> [...]
>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index d33cc2d582..b7a92be055 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -477,6 +477,8 @@
>>>>    #                    will be handled faster.  This is a performance feature and
>>>>    #                    should not affect the correctness of postcopy migration.
>>>>    #                    (since 7.1)
>>>> +# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
>>>> +#               (since 8.0)
>>>
>>> Feels too terse.  What exactly is used and how?  It's not the capability
>>> itself (although the text sure sounds like it).  I guess it's the thing
>>> you set with command set-vcpu-dirty-limit.
>>>
>>> Is that used only when the capability is set?
>>
>> Yes, live migration set "dirty-limit" value when that capability is set,
>> the comment changes to "Apply the algorithm of dirty page rate limit to throttle down guest if capability is set, rather than auto-converge".
>>
>> Please continue to polish the doc if needed. Thanks.
> 
> Let's see whether I understand.
> 
> Throttling happens only during migration.
> 
> There are two throttling algorithms: "auto-converge" (default) and
> "dirty page rate limit".
> 
> The latter can be tuned with set-vcpu-dirty-limit.
> 
> Correct?
Yes
> 
> What happens when migration capability dirty-limit is enabled, but the
> user hasn't set a limit with set-vcpu-dirty-limit, or canceled it with
> cancel-vcpu-dirty-limit?
dirty-limit capability use the default value if user hasn't set. In the 
path of cancel-vcpu-dirty-limit, canceling should be check and not be 
allowed if migration is in process.

see the following code in commit:
[PATCH v4 08/10] migration: Implement dirty-limit convergence algo

--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -438,6 +438,8 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
                                   int64_t cpu_index,
                                   Error **errp)
  {
+    MigrationState *ms = migrate_get_current();
+
      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
          return;
      }
@@ -451,6 +453,15 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
          return;
      }

+    if (migration_is_running(ms->state) &&
+        (!qemu_thread_is_self(&ms->thread)) &&
+        migrate_dirty_limit() &&
+        dirtylimit_in_service()) {
+        error_setg(errp, "can't cancel dirty page limit while"
+                   " migration is running");
+        return;
+    }
+
      dirtylimit_state_lock();

      if (has_cpu_index) {
@@ -486,6 +497,8 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
                                uint64_t dirty_rate,
                                Error **errp)
  {
+    MigrationState *ms = migrate_get_current();
+
      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
          error_setg(errp, "dirty page limit feature requires KVM with"
                     " accelerator property 'dirty-ring-size' set'");
@@ -502,6 +515,15 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
          return;
      }

+    if (migration_is_running(ms->state) &&
+        (!qemu_thread_is_self(&ms->thread)) &&
+        migrate_dirty_limit() &&
+        dirtylimit_in_service()) {
+        error_setg(errp, "can't cancel dirty page limit while"
+                   " migration is running");
+        return;
+    }
+
      dirtylimit_state_lock();

      if (!dirtylimit_in_service()) {
-- 

> 
>>>>    #
>>>>    # Features:
>>>>    # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>>>> @@ -492,7 +494,7 @@
>>>>               'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>>>>               { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>>>>               'validate-uuid', 'background-snapshot',
>>>> -           'zero-copy-send', 'postcopy-preempt'] }
>>>> +           'zero-copy-send', 'postcopy-preempt', 'dirty-limit'] }
>>>>      ##
>>>>    # @MigrationCapabilityStatus:
>>> [...]
>>>
> 

-- 
Best regard

Hyman Huang(黄勇)

