Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086860052A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 04:18:50 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okFiK-0003P1-Uu
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 22:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1okFex-0000Gb-6L
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 22:15:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:32019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1okFeu-0006pO-Fg
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 22:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665972916; x=1697508916;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vOLVvIFbDn+E/yZyKWKZKMQJK1U6NykmwT2IybnWaXo=;
 b=YRxn6wW2cnjkSaGmvpTrz0YBn4oVdPlywxI56XuKNC30BBXl+P9pOEeQ
 A2bNKhCtNZ33Pcg07WZm4ZDz+z4b+NYqgwC+qhybNtk5rgC3LxGMh0XJh
 QF+Wk2GTjp3o7PmWxCq9UzXepDAd2xC6ZmZjS4c9yWicpGDSTb1q2nASG
 uSPdmGDcV3LaninCsKr1Q58hpK9J1oo7He9Q5Ib0cB19IEJn65cxzgR3h
 AJp5wsnp0faDtTqhYIFW7/Mant0VEdWnhqHMur0H/BO0sCyjQ9DmNX/6Q
 AeyHt2Q+7nhDq0jHy3auM+Q1bfiG89nVFvQbbs0Nr60k3n/+n9HYJj3px A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="285412288"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="285412288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2022 19:15:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="659188876"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="659188876"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.139])
 ([10.238.212.139])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2022 19:15:12 -0700
Message-ID: <0294749d-629f-6ab5-64a4-026a4c5ea013@intel.com>
Date: Mon, 17 Oct 2022 10:15:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH] qemu-config: extract same logic in *_add_opts() to
 fill_config_groups()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220902142028.1469716-1-lei4.wang@intel.com>
 <87edwuxl6y.fsf@pond.sub.org>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <87edwuxl6y.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei4.wang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping for any comments.

BR,
Lei

On 9/2/2022 3:57 PM, Markus Armbruster wrote:
> Cc: Gerd & Kevin, because they were involved with the code that gets
> refactored here, and no good deed shall go unpunished.
> 
> "Wang, Lei" <lei4.wang@intel.com> writes:
> 
>> QEMU use qemu_add_opts() and qemu_add_drive_opts() to add config options
>> when initialization. Extract the same logic in both functions to a
>> seperate function fill_config_groups() to reduce code redundency.
>>
>> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
>> ---
>>  util/qemu-config.c | 39 ++++++++++++++++++++-------------------
>>  1 file changed, 20 insertions(+), 19 deletions(-)
>>
>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>> index 433488aa56..3a1c85223a 100644
>> --- a/util/qemu-config.c
>> +++ b/util/qemu-config.c
>> @@ -282,36 +282,37 @@ QemuOptsList *qemu_find_opts_err(const char *group, Error **errp)
>>      return find_list(vm_config_groups, group, errp);
>>  }
>>  
>> -void qemu_add_drive_opts(QemuOptsList *list)
>> +static int fill_config_groups(QemuOptsList *groups[], int entries,
>> +                              QemuOptsList *list)
>>  {
>> -    int entries, i;
>> +    int i;
>>  
>> -    entries = ARRAY_SIZE(drive_config_groups);
>>      entries--; /* keep list NULL terminated */
>>      for (i = 0; i < entries; i++) {
>> -        if (drive_config_groups[i] == NULL) {
>> -            drive_config_groups[i] = list;
>> -            return;
>> +        if (groups[i] == NULL) {
>> +            groups[i] = list;
>> +            return 0;
>>          }
>>      }
>> -    fprintf(stderr, "ran out of space in drive_config_groups");
>> -    abort();
>> +    return -1;
>>  }
>>  
>> -void qemu_add_opts(QemuOptsList *list)
>> +void qemu_add_drive_opts(QemuOptsList *list)
>>  {
>> -    int entries, i;
>> +    if (fill_config_groups(drive_config_groups, ARRAY_SIZE(drive_config_groups),
>> +                           list) < 0) {
>> +        fprintf(stderr, "ran out of space in drive_config_groups");
>> +        abort();
>> +    }
>> +}
>>  
>> -    entries = ARRAY_SIZE(vm_config_groups);
>> -    entries--; /* keep list NULL terminated */
>> -    for (i = 0; i < entries; i++) {
>> -        if (vm_config_groups[i] == NULL) {
>> -            vm_config_groups[i] = list;
>> -            return;
>> -        }
>> +void qemu_add_opts(QemuOptsList *list)
>> +{
>> +    if (fill_config_groups(vm_config_groups, ARRAY_SIZE(vm_config_groups),
>> +                           list) < 0) {
>> +        fprintf(stderr, "ran out of space in vm_config_groups");
>> +        abort();
>>      }
>> -    fprintf(stderr, "ran out of space in vm_config_groups");
>> -    abort();
>>  }
>>  
>>  /* Returns number of config groups on success, -errno on error */
> 

