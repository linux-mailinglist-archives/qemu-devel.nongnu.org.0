Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACDF3A6453
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:21:40 +0200 (CEST)
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskex-0001EE-CI
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lskdK-0007Ue-Jg; Mon, 14 Jun 2021 07:19:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:46744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lskdI-0003E6-Ij; Mon, 14 Jun 2021 07:19:58 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D136421984;
 Mon, 14 Jun 2021 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623669592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z11yPelIfrZI7kSY9AftP9/NICYUQr/Mka6EaD8p9wc=;
 b=K8cYJTH1RZVutoKvc0n4Te/Pdk1dSatwRuqco7SAMJSwie1YlTit+2KuhQSz10uKx8RQWS
 VV1hMmWqvI1hNn3OVJtTlBm0jcxjcF0DT3fDNB9t6Y4NeM4qdA5G7ZBprIRzgOAAUId36H
 guX5Onupn1miuc3KzEScn1IVqlWEKHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623669592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z11yPelIfrZI7kSY9AftP9/NICYUQr/Mka6EaD8p9wc=;
 b=ZwzU6mJkRaFG+XIedc4K9btnfhu5wtgHnq3JMraDk99s6DCn5b8ng0iPQ9eTQTmSeFPluf
 0I6x5q9B7NtNbHBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3AD83118DD;
 Mon, 14 Jun 2021 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623669592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z11yPelIfrZI7kSY9AftP9/NICYUQr/Mka6EaD8p9wc=;
 b=K8cYJTH1RZVutoKvc0n4Te/Pdk1dSatwRuqco7SAMJSwie1YlTit+2KuhQSz10uKx8RQWS
 VV1hMmWqvI1hNn3OVJtTlBm0jcxjcF0DT3fDNB9t6Y4NeM4qdA5G7ZBprIRzgOAAUId36H
 guX5Onupn1miuc3KzEScn1IVqlWEKHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623669592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z11yPelIfrZI7kSY9AftP9/NICYUQr/Mka6EaD8p9wc=;
 b=ZwzU6mJkRaFG+XIedc4K9btnfhu5wtgHnq3JMraDk99s6DCn5b8ng0iPQ9eTQTmSeFPluf
 0I6x5q9B7NtNbHBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id puRLDFg7x2BeDQAALh3uQQ
 (envelope-from <cfontana@suse.de>); Mon, 14 Jun 2021 11:19:52 +0000
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com> <YMIHDKEGQWKtwEU5@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5c0c4831-b7ab-4260-9436-ffc94b2a9b22@suse.de>
Date: Mon, 14 Jun 2021 13:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YMIHDKEGQWKtwEU5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.144,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 2:35 PM, Daniel P. Berrangé wrote:
> On Thu, Jun 10, 2021 at 07:57:54AM +0200, Gerd Hoffmann wrote:
>> Add module_allow_arch() to set the target architecture.
>> In case a module is limited to some arch verify arches
>> match and ignore the module if not.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  include/qemu/module.h |  1 +
>>  softmmu/vl.c          |  3 +++
>>  util/module.c         | 15 +++++++++++++++
>>  3 files changed, 19 insertions(+)
>>
>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>> index d3cab3c25a2f..7825f6d8c847 100644
>> --- a/include/qemu/module.h
>> +++ b/include/qemu/module.h
>> @@ -72,6 +72,7 @@ void module_call_init(module_init_type type);
>>  bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
>>  void module_load_qom_one(const char *type);
>>  void module_load_qom_all(void);
>> +void module_allow_arch(const char *arch);
>>  
>>  /*
>>   * macros to store module metadata in a .modinfo section.
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index ba26a042b284..96316774fcc9 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -126,6 +126,8 @@
>>  #include "sysemu/iothread.h"
>>  #include "qemu/guest-random.h"
>>  
>> +#include "config-host.h"
>> +
>>  #define MAX_VIRTIO_CONSOLES 1
>>  
>>  typedef struct BlockdevOptionsQueueEntry {
>> @@ -2723,6 +2725,7 @@ void qemu_init(int argc, char **argv, char **envp)
>>      error_init(argv[0]);
>>      qemu_init_exec_dir(argv[0]);
>>  
>> +    module_allow_arch(TARGET_NAME);
>>      qemu_init_subsystems();
>>  
>>      /* first pass of option parsing */
>> diff --git a/util/module.c b/util/module.c
>> index 6e4199169c41..564b8e3da760 100644
>> --- a/util/module.c
>> +++ b/util/module.c
>> @@ -122,6 +122,12 @@ void module_call_init(module_init_type type)
>>  static Modules *modinfo;
>>  static char *module_dirs[5];
>>  static int module_ndirs;
>> +static const char *module_arch;
>> +
>> +void module_allow_arch(const char *arch)
>> +{
>> +    module_arch = arch;
>> +}
>>  
>>  static void module_load_path_init(void)
>>  {
>> @@ -295,6 +301,14 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>      module_load_modinfo();
>>  
>>      for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
>> +        if (modlist->value->has_arch) {
>> +            if (strcmp(modlist->value->name, module_name) == 0) {
>> +                if (!module_arch ||
>> +                    strcmp(modlist->value->arch, module_arch) != 0) {
>> +                    return false;
>> +                }
>> +            }
>> +        }
> 
> I have a little hard time following the code paths, but IIUC, with this
> change, instead of "module.so" we would have multiple copies of something
> like "module-$arch.so" ?  Then we load them all, read their modinfo section
> and discard the ones with non-matching arch ?
> 
> If that is a correct understanding, then I wonder about the scalability of
> it. We have 30 system emulator targets right now, so if we get even a few
> arch specific modues, that's going to be alot of modules we're loading,
> checking and discarding.
> 
> Wouldn't it be simpler if we just made use of the directory layout
> /usr/lib64/qemu/$mod.so for common modules and /usr/lib64/qemu/$arch/$mod.so
> for arch specific modules. That would let us load only the modules we know
> are applicable for the system target arch and not need this post-load
> filtering from metadata.
> 
> Regards,
> Daniel
> 

agreed.

Claudio

