Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99C2C6B33
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:59:42 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kii21-00089q-Db
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kii0o-0007X7-Vb
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:58:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:53590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kii0m-0008Se-Q2
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:58:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CB98AC75;
 Fri, 27 Nov 2020 17:58:23 +0000 (UTC)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
 <20201127170634.GA2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7f012127-5c85-d3c4-08c0-4a12cc9e3958@suse.de>
Date: Fri, 27 Nov 2020 18:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127170634.GA2271382@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 6:06 PM, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 11:32:17PM +0100, Claudio Fontana wrote:
>> add a new optional interface to CPUClass,
>> which allows accelerators to extend the CPUClass
>> with additional accelerator-specific initializations.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> [...]
>> +static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
>> +{
>> +    CPUClass *cc = CPU_CLASS(klass);
>> +    AccelCPUClass *accel_cpu_interface = opaque;
>> +
>> +    cc->accel_cpu_interface = accel_cpu_interface;
>> +    if (accel_cpu_interface->cpu_class_init) {
>> +        accel_cpu_interface->cpu_class_init(cc);
>> +    }
>> +}
> 
> So, now that the approach we're following to trigger the
> accel_init_cpu*() call is less controversial (thanks for your
> patience!), we can try to address the monkey patching issue:
> 
> Monkey patching classes like this is acceptable as an initial
> solution, but I'd like us to have a plan to eventually get rid of
> it.  Monkey patching CPU classes makes querying of CPU model
> information less predictable and subtly dependent on QEMU
> initialization state.


The question of QEMU initialization state and the querying of supported functionality, also in relationship with the loadable modules, is I think a larger discussion.

Regardless of the amount of glue code and lipstick, this is hiding the fact that the fundamentals of the object hierarchy for cpus are wrong,
and are (unfortunately) codified as part of the external interface.


> 
> Removing CPUClass.accel_cpu_interface may be easy, because it
> should be possible to just call current_accel() when realizing
> CPUs.  Getting rid of CPUClass.cpu_class_init might be more
> difficult, depending on what the ->cpu_class_init() function is
> doing.


This seems to be for a next step to me.

Ciao,

Claudio


> 
>> +
>> +/* initialize the arch-specific accel CpuClass interfaces */
>> +static void accel_init_cpu_interfaces(AccelClass *ac, const char *cpu_type)
>> +{
>> +    const char *ac_name; /* AccelClass name */
>> +    char *acc_name;      /* AccelCPUClass name */
>> +    ObjectClass *acc;    /* AccelCPUClass */
>> +
>> +    ac_name = object_class_get_name(OBJECT_CLASS(ac));
>> +    g_assert(ac_name != NULL);
>> +
>> +    acc_name = g_strdup_printf("%s-%s", ac_name, CPU_RESOLVING_TYPE);
>> +    acc = object_class_by_name(acc_name);
>> +    g_free(acc_name);
>> +
>> +    if (acc) {
>> +        object_class_foreach(accel_init_cpu_int_aux, cpu_type, false, acc);
>> +    }
>> +}
>> +
>>  void accel_init_interfaces(AccelClass *ac, const char *cpu_type)
>>  {
>>  #ifndef CONFIG_USER_ONLY
>>      accel_init_ops_interfaces(ac);
>>  #endif /* !CONFIG_USER_ONLY */
>> +
>> +    accel_init_cpu_interfaces(ac, cpu_type);
>>  }
> [...]
> 


