Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2C44634D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 13:20:50 +0100 (CET)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miyDA-0007Bf-RG
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 08:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1miy7J-0003AZ-26
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:14:45 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:35666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1miy7F-0000QU-K5
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:14:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07441215|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00479531-8.87397e-05-0.995116;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.Lo4i.QP_1636114471; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lo4i.QP_1636114471)
 by smtp.aliyun-inc.com(10.147.41.120);
 Fri, 05 Nov 2021 20:14:32 +0800
Subject: Re: [PATCH] configure: Support modules for Windows
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211105032002.83792-1-zhiwei_liu@c-sky.com>
 <YYT5w9fAh6EJY3Ku@redhat.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <ab58838b-5e7d-ca08-f641-ab8e8d2ba3d8@c-sky.com>
Date: Fri, 5 Nov 2021 20:14:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYT5w9fAh6EJY3Ku@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/5 下午5:30, Daniel P. Berrangé wrote:
> On Fri, Nov 05, 2021 at 11:20:02AM +0800, LIU Zhiwei wrote:
>
> Generally we expect a commit message describing what is being solved
> and any reasons for the approach taken.

This patch relaxes all constraints on modules for Windows.  It firstly 
exports  all symbols of the
target executable to an import library. Then  all modules link with the 
import library .

>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   configure   |  7 +------
>>   meson.build | 34 ++++++++++++++++++++++++----------
>>   2 files changed, 25 insertions(+), 16 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 33682cb971..6280e412a9 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1422,7 +1422,7 @@ cat << EOF
>>     bsd-user        all BSD usermode emulation targets
>>     guest-agent     build the QEMU Guest Agent
>>     pie             Position Independent Executables
>> -  modules         modules support (non-Windows)
>> +  modules         modules support
>>     module-upgrades try to load modules from alternate paths for upgrades
>>     debug-tcg       TCG debugging (default is disabled)
>>     debug-info      debugging information
>> @@ -1698,11 +1698,6 @@ else
>>     QEMU_CFLAGS="$QEMU_CFLAGS -Wno-missing-braces"
>>   fi
>>   
>> -# Our module code doesn't support Windows
>> -if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
>> -  error_exit "Modules are not available for Windows"
>> -fi
>> -
>>   # module_upgrades is only reasonable if modules are enabled
>>   if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
>>     error_exit "Can't enable module-upgrades as Modules are not enabled"
>> diff --git a/meson.build b/meson.build
>> index 47df10afc2..26195cb24f 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2625,7 +2625,7 @@ block_mods = []
>>   softmmu_mods = []
>>   foreach d, list : modules
>>     foreach m, module_ss : list
>> -    if enable_modules and targetos != 'windows'
>> +    if enable_modules
>>         module_ss = module_ss.apply(config_all, strict: false)
>>         sl = static_library(d + '-' + m, [genh, module_ss.sources()],
>>                             dependencies: [modulecommon, module_ss.dependencies()], pic: true)
>> @@ -2658,7 +2658,7 @@ endforeach
>>   
>>   foreach d, list : target_modules
>>     foreach m, module_ss : list
>> -    if enable_modules and targetos != 'windows'
>> +    if enable_modules
>>         foreach target : target_dirs
>>           if target.endswith('-softmmu')
>>             config_target = config_target_mak[target]
>> @@ -2800,14 +2800,15 @@ common_ss.add(hwcore)
>>   ###########
>>   # Targets #
>>   ###########
>> -
>> -foreach m : block_mods + softmmu_mods
>> -  shared_module(m.name(),
>> -                name_prefix: '',
>> -                link_whole: m,
>> -                install: true,
>> -                install_dir: qemu_moddir)
>> -endforeach
>> +if targetos != 'windows'
>> +  foreach m : block_mods + softmmu_mods
>> +    shared_module(m.name(),
>> +                  name_prefix: '',
>> +                  link_whole: m,
>> +                  install: true,
>> +                  install_dir: qemu_moddir)
>> +  endforeach
>> +endif
>>   
>>   softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
>>   common_ss.add(qom, qemuutil)
>> @@ -2826,6 +2827,7 @@ common_all = static_library('common',
>>   feature_to_c = find_program('scripts/feature_to_c.sh')
>>   
>>   emulators = {}
>> +emulator = 0
>>   foreach target : target_dirs
>>     config_target = config_target_mak[target]
>>     target_name = config_target['TARGET_NAME']
>> @@ -2966,6 +2968,7 @@ foreach target : target_dirs
>>                  link_language: link_language,
>>                  link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
>>                  link_args: link_args,
>> +               implib: true,
>>                  win_subsystem: exe['win_subsystem'])
>>   
>>       if targetos == 'darwin'
>> @@ -3023,6 +3026,17 @@ foreach target : target_dirs
>>       endif
>>     endforeach
>>   endforeach
>> +if (targetos == 'windows')
>> +  foreach m : block_mods + softmmu_mods
>> +    shared_module(m.name(),
>> +	    name_prefix: '',
>> +	    link_whole: m,
>> +	    install: true,
>> +	    dependencies: glib,
>> +	    link_with: emulator,
> AFAIK from the docs meson wants "link_with" to be a list of
> libraries.

The emulator is an import library.

There has been an executable variable named emulator in origin meson.build.
An implib keyword args has been  added in this patch when the executable 
generates.
And I declare it to the out-most level  to make it visible for modules 
after the build of targets.

> This is passing a literal '0' which doesn't
> make sense. Is this really needed ?

It will not be a literal '0'

> What is the reason for the "dependencies" addition ?

I don't think the import library will include the symbols of glib.  And 
many modules need
link with glib. So I add the dependencies.

> Can we not just use the existing shared_module() rules
> we already have. It might be ok to just add dependencies
> to the existing rule even for non-windows.

I think you are right. It is difficult for me to add all dependencies to 
modules.
I use a rough method that export all symbols in the executable.

I am not clear about the right way to support this feature. Look forward 
to you more advice.

Thanks,
Zhiwei

>> +	    install_dir: qemu_moddir)
>> +  endforeach
>> +endif
>
>
> Regards,
> Daniel

