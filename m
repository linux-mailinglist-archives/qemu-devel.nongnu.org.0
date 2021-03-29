Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E6834CCFD
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:26:52 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoAd-0008Ti-W1
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lQo85-000751-Au; Mon, 29 Mar 2021 05:24:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lQo7z-0004oh-Mf; Mon, 29 Mar 2021 05:24:13 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12T948ek069464; Mon, 29 Mar 2021 05:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=KtR2gtZBTXynmFoaIQUPB36jR2X+bDje79BXt0/UUWw=;
 b=b8w3T3KWNheWIZh4niYFTydZOLvibUPD0IMZO521FmxkzMCXNE7D0xIpE24LREg9cYe2
 sIdbPYL3H9+0ZwOQI+9JYEMyku/SxcfkBUKfHVgHlYPYRK/6K2vyaOYGEafAhXz3WQIN
 fcr31FBMzlaeYKUGLQachGpFZWmcmktMRs/Dg7YmgG1jHUMrZDypIJkOUfT3nNqz8cg0
 KPDVBUcPZMaw3AzuVmAwKWaiT3sKEfyKUxcvBfnXMONlLjsvOvm8urqLBq364NuicBZa
 Kf+GMYHa5kbzok1YGQpqiA6KNMKuo13c/7wuJiVpIgVhukK0eXVh4z2xWL67qNmsixBc Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jj98s60r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 05:23:56 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12T96E8Y078138;
 Mon, 29 Mar 2021 05:23:56 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jj98s5yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 05:23:55 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12T9DVnh022350;
 Mon, 29 Mar 2021 09:23:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 37hvb88v71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 09:23:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12T9Np5l41812284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 09:23:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69AEA52050;
 Mon, 29 Mar 2021 09:23:51 +0000 (GMT)
Received: from [9.77.196.188] (unknown [9.77.196.188])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4A32D52054;
 Mon, 29 Mar 2021 09:23:48 +0000 (GMT)
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] spapr: nvdimm: Implement H_SCM_FLUSH hcall
To: David Gibson <david@gibson.dropbear.id.au>
References: <161650723087.2959.8703728357980727008.stgit@6532096d84d3>
 <161650725183.2959.12071056430236337803.stgit@6532096d84d3>
 <YFqs8M1dHAFhdCL6@yekko.fritz.box>
Message-ID: <13744465-ca7a-0aaf-5abb-43a70a39c167@linux.ibm.com>
Date: Mon, 29 Mar 2021 14:53:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YFqs8M1dHAFhdCL6@yekko.fritz.box>
Content-Type: multipart/alternative;
 boundary="------------7D0D80A72CF417904AF55A0A"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iiRzvzgBGYE802w29iw-3XBvPv0QF6wC
X-Proofpoint-ORIG-GUID: JxrHrep7tjmAYwbA_6UUN4owRKHr0f_w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_04:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103290071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: ehabkost@redhat.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 bharata@linux.vnet.ibm.com, linux-nvdimm@lists.01.org, groug@kaod.org,
 kvm-ppc@vger.kernel.org, qemu-devel@nongnu.org, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, imammedo@redhat.com, sbhat@linux.vnet.ibm.com,
 xiaoguangrong.eric@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------7D0D80A72CF417904AF55A0A
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 3/24/21 8:37 AM, David Gibson wrote:
> On Tue, Mar 23, 2021 at 09:47:38AM -0400, Shivaprasad G Bhat wrote:
>> machine vmstate.
>>
>> Signed-off-by: Shivaprasad G Bhat<sbhat@linux.ibm.com>
> An overal question: surely the same issue must arise on x86 with
> file-backed NVDIMMs.  How do they handle this case?

Discussed in other threads..

....

>>   };
>> @@ -2997,6 +3000,9 @@ static void spapr_machine_init(MachineState *machine)
>>       }
>>   
>>       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>> +    qemu_mutex_init(&spapr->spapr_nvdimm_flush_states_lock);
> Do you actually need an extra mutex, or can you rely on the BQL?

I verified BQL is held at all places where it matters in the context of 
this patch.

Safe to get rid of this extra mutex.

...

>
>> +{
>> +     SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +
>> +     return (!QLIST_EMPTY(&spapr->pending_flush_states) ||
>> +             !QLIST_EMPTY(&spapr->completed_flush_states));
>> +}
>> +
>> +static int spapr_nvdimm_pre_save(void *opaque)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +
>> +    while (!QLIST_EMPTY(&spapr->pending_flush_states)) {
>> +        aio_poll(qemu_get_aio_context(), true);
> Hmm... how long could waiting for all the pending flushes to complete
> take?  This could add substanially to the guest's migration downtime,
> couldn't it?


The time taken depends on the number of dirtied pages and the disk io 
write speed. The number of dirty pages on host is configureable with 
tunables vm.dirty_background_ratio (10% default on Fedora 32, Ubuntu 
20.04), vm.dirty_ratio(20%) of host memory and|or 
vm.dirty_expire_centisecs(30 seconds). So, the host itself would be 
flushing the mmaped file on its own from time to time. For guests using 
the nvdimms with filesystem, the flushes would have come frequently and 
the number of dirty pages might be less. The pmem applications can use 
the nvdimms without a filesystem. And for such guests, the chances that 
a flush request can come from pmem applications at the time of migration 
is less or is random. But, the host would have flushed the pagecache on 
its own when vm.dirty_background_ratio is crossed or 
vm.dirty_expire_centisecs expired. So, the worst case would stands at 
disk io latency for writing the dirtied pages in the last 
vm.dirty_expire_centisecs on host OR latency for writing maximum 
vm.dirty_background_ratio(10%) of host RAM. If you want me to calibrate 
any particular size, scenario and get the numbers please let me know.

...
>> +
>> +/*
>> + * Acquire a unique token and reserve it for the new flush state.
>> + */
>> +static SpaprNVDIMMDeviceFlushState *spapr_nvdimm_init_new_flush_state(void)
>> +{
>> +    Error *err = NULL;
>> +    uint64_t token;
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +    SpaprNVDIMMDeviceFlushState *tmp, *next, *state;
>> +
>> +    state = g_malloc0(sizeof(*state));
>> +
>> +    qemu_mutex_lock(&spapr->spapr_nvdimm_flush_states_lock);
>> +retry:
>> +    if (qemu_guest_getrandom(&token, sizeof(token), &err) < 0) {
> Using getrandom seems like overkill, why not just use a counter?

I didnt want a spurious guest to abuse by consuming the return value 
providing

a valid "guess-able" counter and the real driver failing subsequently. 
Also, across

guest migrations carrying the global counter to destination is another 
thing to ponder.


Let me know if you want me to reconsider using counter.

...

>> mm_flush_states_lock);
>> +
>> +    return state;
>> +}
>> +
>> +/*
>> + * spapr_nvdimm_finish_flushes
>> + *      Waits for all pending flush requests to complete
>> + *      their execution and free the states
>> + */
>> +void spapr_nvdimm_finish_flushes(void)
>> +{
>> +    SpaprNVDIMMDeviceFlushState *state, *next;
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> The caller has natural access to the machine, so pass it in rather
> than using the global.

okay

...

>> +
>> +/*
>> + * spapr_nvdimm_get_hcall_status
>> + *      Fetches the status of the hcall worker and returns H_BUSY
>> + *      if the worker is still running.
>> + */
>> +static int spapr_nvdimm_get_flush_status(uint64_t token)
>> +{
>> +    int ret = H_LONG_BUSY_ORDER_10_MSEC;
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> The callers have natural access to spapr, so pass it in rather than
> using the global.

Okay

...

>> +
>> +/*
>> + * H_SCM_FLUSH
>> + * Input: drc_index, continue-token
>> + * Out: continue-token
>> + * Return Value: H_SUCCESS, H_Parameter, H_P2, H_BUSY
>> + *
>> + * Given a DRC Index Flush the data to backend NVDIMM device.
>> + * The hcall returns H_BUSY when the flush takes longer time and the hcall
> It returns one of the H_LONG_BUSY values, not actual H_BUSY, doesn't
> it?

Yes. I thought its okay to call it just H_BUSY in a generic way. Will 
fix it.


>> + * needs to be issued multiple times in order to be completely serviced.
>> +        }
>> +
>> +        return ret;
>> +    }
>> +
>> +    dimm = PC_DIMM(drc->dev);
>> +    backend = MEMORY_BACKEND(dimm->hostmem);
>> +
>> +    state = spapr_nvdimm_init_new_flush_state();
>> +    if (!state) {
>> +        return H_P2;
> AFAICT the only way init_new_flush_state() fails is a failure in the
> RNG, which definitely isn't a parameter problem.

Will change it to H_HARDWARE.


>> +    }
>> +
>> +    state->backend_fd = memory_region_get_fd(&backend->mr);
> Is this guaranteed to return a usable fd in all configurations?

Right, for memory-backend-ram this wont work. I think we should

not set the hcall-flush-required too for memory-backend-ram. Will fix this.

>> +    thread_pool_submit_aio(pool, flush_worker_cb, state,
>> +                           spapr_nvdimm_flush_completion_cb, state);
>> +
>> +    ret = spapr_nvdimm_get_flush_status(state->continue_token);
>> +    if (H_IS_LONG_BUSY(ret)) {
>> +        args[0] = state->continue_token;
>> +    }
>> +
>> +    return ret;
> I believe you can rearrange this so the get_flush_status / check /
> return is shared between the args[0] == 0 and args[0] == token paths.
okay.

Thanks,

Shiva


--------------7D0D80A72CF417904AF55A0A
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD13aW5kb3dzLTEyNTIiPgogIDwvaGVh
ZD4KICA8Ym9keT4KICAgIDxwPjxicj4KICAgIDwvcD4KICAgIDxkaXYgY2xhc3M9Im1vei1j
aXRlLXByZWZpeCI+T24gMy8yNC8yMSA4OjM3IEFNLCBEYXZpZCBHaWJzb24gd3JvdGU6PGJy
PgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6WUZx
czhNMWRIQUZoZENMNkB5ZWtrby5mcml0ei5ib3giPgogICAgICA8cHJlIGNsYXNzPSJtb3ot
cXVvdGUtcHJlIiB3cmFwPSIiPk9uIFR1ZSwgTWFyIDIzLCAyMDIxIGF0IDA5OjQ3OjM4QU0g
LTA0MDAsIFNoaXZhcHJhc2FkIEcgQmhhdCB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdy
YXA9IiI+Cm1hY2hpbmUgdm1zdGF0ZS4KClNpZ25lZC1vZmYtYnk6IFNoaXZhcHJhc2FkIEcg
QmhhdCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86c2Jo
YXRAbGludXguaWJtLmNvbSI+Jmx0O3NiaGF0QGxpbnV4LmlibS5jb20mZ3Q7PC9hPgo8L3By
ZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJl
IiB3cmFwPSIiPkFuIG92ZXJhbCBxdWVzdGlvbjogc3VyZWx5IHRoZSBzYW1lIGlzc3VlIG11
c3QgYXJpc2Ugb24geDg2IHdpdGgKZmlsZS1iYWNrZWQgTlZESU1Ncy4gIEhvdyBkbyB0aGV5
IGhhbmRsZSB0aGlzIGNhc2U/CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHA+RGlz
Y3Vzc2VkIGluIG90aGVyIHRocmVhZHMuLjwvcD4KICAgIDxwPi4uLi48YnI+CiAgICA8L3A+
CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6WUZxczhNMWRIQUZoZENM
NkB5ZWtrby5mcml0ei5ib3giPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAg
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPiB9OwpAQCAtMjk5Nyw2
ICszMDAwLDkgQEAgc3RhdGljIHZvaWQgc3BhcHJfbWFjaGluZV9pbml0KE1hY2hpbmVTdGF0
ZSAqbWFjaGluZSkKICAgICB9CiAKICAgICBxZW11X2NvbmRfaW5pdCgmYW1wO3NwYXByLSZn
dDtmd25taV9tYWNoaW5lX2NoZWNrX2ludGVybG9ja19jb25kKTsKKyAgICBxZW11X211dGV4
X2luaXQoJmFtcDtzcGFwci0mZ3Q7c3BhcHJfbnZkaW1tX2ZsdXNoX3N0YXRlc19sb2NrKTsK
PC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj5EbyB5b3UgYWN0dWFsbHkgbmVlZCBhbiBleHRyYSBtdXRleCwgb3Ig
Y2FuIHlvdSByZWx5IG9uIHRoZSBCUUw/PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8
cD5JIHZlcmlmaWVkIEJRTCBpcyBoZWxkIGF0IGFsbCBwbGFjZXMgd2hlcmUgaXQgbWF0dGVy
cyBpbiB0aGUKICAgICAgY29udGV4dCBvZiB0aGlzIHBhdGNoLjwvcD4KICAgIDxwPlNhZmUg
dG8gZ2V0IHJpZCBvZiB0aGlzIGV4dHJhIG11dGV4LiA8YnI+CiAgICA8L3A+CiAgICA8cD4u
Li48YnI+CiAgICA8L3A+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6
WUZxczhNMWRIQUZoZENMNkB5ZWtrby5mcml0ei5ib3giPjxicj4KICAgICAgPGJsb2NrcXVv
dGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3Jh
cD0iIj4reworICAgICBTcGFwck1hY2hpbmVTdGF0ZSAqc3BhcHIgPSBTUEFQUl9NQUNISU5F
KHFkZXZfZ2V0X21hY2hpbmUoKSk7CisKKyAgICAgcmV0dXJuICghUUxJU1RfRU1QVFkoJmFt
cDtzcGFwci0mZ3Q7cGVuZGluZ19mbHVzaF9zdGF0ZXMpIHx8CisgICAgICAgICAgICAgIVFM
SVNUX0VNUFRZKCZhbXA7c3BhcHItJmd0O2NvbXBsZXRlZF9mbHVzaF9zdGF0ZXMpKTsKK30K
Kworc3RhdGljIGludCBzcGFwcl9udmRpbW1fcHJlX3NhdmUodm9pZCAqb3BhcXVlKQorewor
ICAgIFNwYXByTWFjaGluZVN0YXRlICpzcGFwciA9IFNQQVBSX01BQ0hJTkUocWRldl9nZXRf
bWFjaGluZSgpKTsKKworICAgIHdoaWxlICghUUxJU1RfRU1QVFkoJmFtcDtzcGFwci0mZ3Q7
cGVuZGluZ19mbHVzaF9zdGF0ZXMpKSB7CisgICAgICAgIGFpb19wb2xsKHFlbXVfZ2V0X2Fp
b19jb250ZXh0KCksIHRydWUpOwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkhtbS4uLiBob3cgbG9uZyBjb3Vs
ZCB3YWl0aW5nIGZvciBhbGwgdGhlIHBlbmRpbmcgZmx1c2hlcyB0byBjb21wbGV0ZQp0YWtl
PyAgVGhpcyBjb3VsZCBhZGQgc3Vic3RhbmlhbGx5IHRvIHRoZSBndWVzdCdzIG1pZ3JhdGlv
biBkb3dudGltZSwKY291bGRuJ3QgaXQ/PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8
cHJlPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI5LCAyOCwgMjkpOyBmb250LXNpemU6IDE1
cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogY29tbW9u
LWxpZ2F0dXJlczsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQw
MDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogbGVmdDsgdGV4dC1pbmRl
bnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdv
cmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IGJhY2tn
cm91bmQtY29sb3I6IHJnYigyNDgsIDI0OCwgMjQ4KTsgdGV4dC1kZWNvcmF0aW9uLXRoaWNr
bmVzczogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRl
Y29yYXRpb24tY29sb3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBm
bG9hdDogbm9uZTsiPjwvc3Bhbj4KPC9wcmU+CiAgICA8cHJlPjxzcGFuIHN0eWxlPSJjb2xv
cjogcmdiKDI5LCAyOCwgMjkpOyBmb250LXNpemU6IDE1cHg7IGZvbnQtc3R5bGU6IG5vcm1h
bDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogY29tbW9uLWxpZ2F0dXJlczsgZm9udC12YXJp
YW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5v
cm1hbDsgdGV4dC1hbGlnbjogbGVmdDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Vi
a2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDgs
IDI0OCwgMjQ4KTsgdGV4dC1kZWNvcmF0aW9uLXRoaWNrbmVzczogaW5pdGlhbDsgdGV4dC1k
ZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRp
YWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPjxzcGFuIHN0
eWxlPSJjb2xvcjogcmdiKDI5LCAyOCwgMjkpOyBmb250LXNpemU6IDE1cHg7IGZvbnQtc3R5
bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogY29tbW9uLWxpZ2F0dXJlczsg
Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNw
YWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogbGVmdDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4
dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzog
MHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6
IHJnYigyNDgsIDI0OCwgMjQ4KTsgdGV4dC1kZWNvcmF0aW9uLXRoaWNrbmVzczogaW5pdGlh
bDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29s
b3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsi
Pjwvc3Bhbj4KCiAgICAKPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjksIDI4LCAyOSk7IGZv
bnQtc2l6ZTogMTVweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1
cmVzOiBjb21tb24tbGlnYXR1cmVzOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250
LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBsZWZ0
OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6
IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6
IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0OCwgMjQ4LCAyNDgpOyB0ZXh0LWRlY29y
YXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRp
YWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFp
bXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+IDwvc3Bhbj48L3NwYW4+PHNwYW4gc3R5bGU9ImNv
bG9yOiByZ2IoMjksIDI4LCAyOSk7IGZvbnQtc2l6ZTogMTVweDsgZm9udC1zdHlsZTogbm9y
bWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBjb21tb24tbGlnYXR1cmVzOyBmb250LXZh
cmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzog
bm9ybWFsOyB0ZXh0LWFsaWduOiBsZWZ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5z
Zm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13
ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0
OCwgMjQ4LCAyNDgpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0
LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5p
dGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+PHNwYW4g
c3R5bGU9ImNvbG9yOiByZ2IoMjksIDI4LCAyOSk7IGZvbnQtc2l6ZTogMTVweDsgZm9udC1z
dHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBjb21tb24tbGlnYXR1cmVz
OyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXIt
c3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBsZWZ0OyB0ZXh0LWluZGVudDogMHB4OyB0
ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5n
OiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xv
cjogcmdiKDI0OCwgMjQ4LCAyNDgpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0
aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1j
b2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25l
OyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjksIDI4LCAyOSk7IGZvbnQtc2l6ZTogMTVw
eDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBjb21tb24t
bGlnYXR1cmVzOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAw
OyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBsZWZ0OyB0ZXh0LWluZGVu
dDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29y
ZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dy
b3VuZC1jb2xvcjogcmdiKDI0OCwgMjQ4LCAyNDgpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tu
ZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVj
b3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZs
b2F0OiBub25lOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjksIDI4LCAyOSk7IGZvbnQt
c2l6ZTogMTVweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVz
OiBjb21tb24tbGlnYXR1cmVzOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdl
aWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBsZWZ0OyB0
ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5v
cm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0OCwgMjQ4LCAyNDgpOyB0ZXh0LWRlY29yYXRp
b24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7
IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBv
cnRhbnQ7IGZsb2F0OiBub25lOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjksIDI4LCAy
OSk7IGZvbnQtc2l6ZTogMTVweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQt
bGlnYXR1cmVzOiBjb21tb24tbGlnYXR1cmVzOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFs
OyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWdu
OiBsZWZ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUt
c3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Ut
d2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0OCwgMjQ4LCAyNDgpOyB0ZXh0
LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6
IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5s
aW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2Io
MjksIDI4LCAyOSk7IGZvbnQtc2l6ZTogMTVweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250
LXZhcmlhbnQtbGlnYXR1cmVzOiBjb21tb24tbGlnYXR1cmVzOyBmb250LXZhcmlhbnQtY2Fw
czogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0
ZXh0LWFsaWduOiBsZWZ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9u
ZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4
dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0OCwgMjQ4LCAy
NDgpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRp
b24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlz
cGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+VGhlIHRpbWUgdGFrZW4g
ZGVwZW5kcyBvbiB0aGUgbnVtYmVyIG9mIGRpcnRpZWQgcGFnZXMgYW5kCnRoZSBkaXNrIGlv
IHdyaXRlPC9zcGFuPgpzcGVlZC4gVGhlIG51bWJlciBvZiBkaXJ0eSBwYWdlcyBvbiBob3N0
CmlzIGNvbmZpZ3VyZWFibGUgd2l0aCB0dW5hYmxlcyAKPC9zcGFuPgp2bS5kaXJ0eV9iYWNr
Z3JvdW5kX3JhdGlvCigxMCUgZGVmYXVsdCBvbiBGZWRvcmEgMzIsIFVidW50dSAyMC4wNCks
IAo8L3NwYW4+CnZtLmRpcnR5X3JhdGlvKDIwJSkKb2YgaG9zdCBtZW1vcnkgYW5kfG9yIHZt
LmRpcnR5X2V4cGlyZV9jZW50aXNlY3MoMzAgc2Vjb25kcykuPC9zcGFuPgpTbywgdGhlIGhv
c3QgaXRzZWxmIHdvdWxkIGJlIGZsdXNoaW5nIHRoZSBtbWFwZWQgZmlsZSBvbiBpdHMKb3du
IGZyb20gdGltZSB0byB0aW1lLgoKPC9zcGFuPgpGb3IgZ3Vlc3RzIHVzaW5nIHRoZSBudmRp
bW1zIHdpdGggZmlsZXN5c3RlbSwgdGhlIGZsdXNoZXMKd291bGQgaGF2ZSBjb21lIGZyZXF1
ZW50bHkgYW5kIHRoZSBudW1iZXIgb2YgZGlydHkgcGFnZXMKbWlnaHQgYmUgbGVzcy4gVGhl
IHBtZW0gYXBwbGljYXRpb25zIGNhbiB1c2UgdGhlIG52ZGltbXMKd2l0aG91dCBhIGZpbGVz
eXN0ZW0uIEFuZCBmb3Igc3VjaCBndWVzdHMsIHRoZSBjaGFuY2VzIHRoYXQKYSBmbHVzaCBy
ZXF1ZXN0IGNhbiBjb21lIGZyb20gcG1lbSBhcHBsaWNhdGlvbnMgYXQgdGhlIHRpbWUKb2Yg
bWlncmF0aW9uIGlzIGxlc3Mgb3IgaXMgcmFuZG9tLiBCdXQsIHRoZSBob3N0IHdvdWxkIGhh
dmUKZmx1c2hlZCB0aGUgcGFnZWNhY2hlIG9uIGl0cyBvd24gd2hlbiB2bS5kaXJ0eV9iYWNr
Z3JvdW5kX3JhdGlvCmlzIGNyb3NzZWQgb3Igdm0uZGlydHlfZXhwaXJlX2NlbnRpc2VjcyBl
eHBpcmVkLiAKClNvLCB0aGUgd29yc3QgY2FzZSB3b3VsZCBzdGFuZHMgYXQgZGlzayBpbyBs
YXRlbmN5IGZvciB3cml0aW5nCnRoZSBkaXJ0aWVkIHBhZ2VzIGluIHRoZSBsYXN0IHZtLmRp
cnR5X2V4cGlyZV9jZW50aXNlY3Mgb24gaG9zdApPUiBsYXRlbmN5IGZvciB3cml0aW5nIG1h
eGltdW0gdm0uZGlydHlfYmFja2dyb3VuZF9yYXRpbygxMCUpCm9mIGhvc3QgUkFNLgoKSWYg
eW91IHdhbnQgbWUgdG8gY2FsaWJyYXRlIGFueSBwYXJ0aWN1bGFyIHNpemUsIHNjZW5hcmlv
IGFuZCBnZXQKdGhlIG51bWJlcnMgcGxlYXNlIGxldCBtZSBrbm93Ljwvc3Bhbj48L3ByZT4K
ICAgIC4uLgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOllGcXM4TTFk
SEFGaGRDTDZAeWVra28uZnJpdHouYm94Ij4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4rCisvKgor
ICogQWNxdWlyZSBhIHVuaXF1ZSB0b2tlbiBhbmQgcmVzZXJ2ZSBpdCBmb3IgdGhlIG5ldyBm
bHVzaCBzdGF0ZS4KKyAqLworc3RhdGljIFNwYXByTlZESU1NRGV2aWNlRmx1c2hTdGF0ZSAq
c3BhcHJfbnZkaW1tX2luaXRfbmV3X2ZsdXNoX3N0YXRlKHZvaWQpCit7CisgICAgRXJyb3Ig
KmVyciA9IE5VTEw7CisgICAgdWludDY0X3QgdG9rZW47CisgICAgU3BhcHJNYWNoaW5lU3Rh
dGUgKnNwYXByID0gU1BBUFJfTUFDSElORShxZGV2X2dldF9tYWNoaW5lKCkpOworICAgIFNw
YXByTlZESU1NRGV2aWNlRmx1c2hTdGF0ZSAqdG1wLCAqbmV4dCwgKnN0YXRlOworCisgICAg
c3RhdGUgPSBnX21hbGxvYzAoc2l6ZW9mKCpzdGF0ZSkpOworCisgICAgcWVtdV9tdXRleF9s
b2NrKCZhbXA7c3BhcHItJmd0O3NwYXByX252ZGltbV9mbHVzaF9zdGF0ZXNfbG9jayk7City
ZXRyeToKKyAgICBpZiAocWVtdV9ndWVzdF9nZXRyYW5kb20oJmFtcDt0b2tlbiwgc2l6ZW9m
KHRva2VuKSwgJmFtcDtlcnIpICZsdDsgMCkgewo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlVzaW5nIGdldHJh
bmRvbSBzZWVtcyBsaWtlIG92ZXJraWxsLCB3aHkgbm90IGp1c3QgdXNlIGEgY291bnRlcj88
L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPkkgZGlkbnQgd2FudCBhIHNwdXJpb3Vz
IGd1ZXN0IHRvIGFidXNlIGJ5IGNvbnN1bWluZyB0aGUgcmV0dXJuCiAgICAgIHZhbHVlIHBy
b3ZpZGluZyA8YnI+CiAgICA8L3A+CiAgICA8cD5hIHZhbGlkICJndWVzcy1hYmxlIiBjb3Vu
dGVyIGFuZCB0aGUgcmVhbCBkcml2ZXIgZmFpbGluZwogICAgICBzdWJzZXF1ZW50bHkuIEFs
c28sIGFjcm9zczwvcD4KICAgIDxwPiBndWVzdCBtaWdyYXRpb25zIGNhcnJ5aW5nIHRoZSBn
bG9iYWwgY291bnRlciB0byBkZXN0aW5hdGlvbiBpcwogICAgICBhbm90aGVyIHRoaW5nIHRv
IHBvbmRlci48L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8cD5MZXQgbWUga25vdyBp
ZiB5b3Ugd2FudCBtZSB0byByZWNvbnNpZGVyIHVzaW5nIGNvdW50ZXIuPC9wPgogICAgPHA+
Li4uPGJyPgogICAgPC9wPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlk
OllGcXM4TTFkSEFGaGRDTDZAeWVra28uZnJpdHouYm94Ij4KICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0i
Ij5tbV9mbHVzaF9zdGF0ZXNfbG9jayk7CisKKyAgICByZXR1cm4gc3RhdGU7Cit9CisKKy8q
CisgKiBzcGFwcl9udmRpbW1fZmluaXNoX2ZsdXNoZXMKKyAqICAgICAgV2FpdHMgZm9yIGFs
bCBwZW5kaW5nIGZsdXNoIHJlcXVlc3RzIHRvIGNvbXBsZXRlCisgKiAgICAgIHRoZWlyIGV4
ZWN1dGlvbiBhbmQgZnJlZSB0aGUgc3RhdGVzCisgKi8KK3ZvaWQgc3BhcHJfbnZkaW1tX2Zp
bmlzaF9mbHVzaGVzKHZvaWQpCit7CisgICAgU3BhcHJOVkRJTU1EZXZpY2VGbHVzaFN0YXRl
ICpzdGF0ZSwgKm5leHQ7CisgICAgU3BhcHJNYWNoaW5lU3RhdGUgKnNwYXByID0gU1BBUFJf
TUFDSElORShxZGV2X2dldF9tYWNoaW5lKCkpOwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlRoZSBjYWxsZXIg
aGFzIG5hdHVyYWwgYWNjZXNzIHRvIHRoZSBtYWNoaW5lLCBzbyBwYXNzIGl0IGluIHJhdGhl
cgp0aGFuIHVzaW5nIHRoZSBnbG9iYWwuPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8
cD5va2F5PC9wPgogICAgPHA+Li4uIDwvcD4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
IGNpdGU9Im1pZDpZRnFzOE0xZEhBRmhkQ0w2QHlla2tvLmZyaXR6LmJveCI+CiAgICAgIDxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1w
cmUiIHdyYXA9IiI+KworLyoKKyAqIHNwYXByX252ZGltbV9nZXRfaGNhbGxfc3RhdHVzCisg
KiAgICAgIEZldGNoZXMgdGhlIHN0YXR1cyBvZiB0aGUgaGNhbGwgd29ya2VyIGFuZCByZXR1
cm5zIEhfQlVTWQorICogICAgICBpZiB0aGUgd29ya2VyIGlzIHN0aWxsIHJ1bm5pbmcuCisg
Ki8KK3N0YXRpYyBpbnQgc3BhcHJfbnZkaW1tX2dldF9mbHVzaF9zdGF0dXModWludDY0X3Qg
dG9rZW4pCit7CisgICAgaW50IHJldCA9IEhfTE9OR19CVVNZX09SREVSXzEwX01TRUM7Cisg
ICAgU3BhcHJNYWNoaW5lU3RhdGUgKnNwYXByID0gU1BBUFJfTUFDSElORShxZGV2X2dldF9t
YWNoaW5lKCkpOwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlRoZSBjYWxsZXJzIGhhdmUgbmF0dXJhbCBhY2Nl
c3MgdG8gc3BhcHIsIHNvIHBhc3MgaXQgaW4gcmF0aGVyIHRoYW4KdXNpbmcgdGhlIGdsb2Jh
bC48L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPk9rYXk8L3A+CiAgICA8cD4uLi48
L3A+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6WUZxczhNMWRIQUZo
ZENMNkB5ZWtrby5mcml0ei5ib3giPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4K
ICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPisKKy8qCisgKiBI
X1NDTV9GTFVTSAorICogSW5wdXQ6IGRyY19pbmRleCwgY29udGludWUtdG9rZW4KKyAqIE91
dDogY29udGludWUtdG9rZW4KKyAqIFJldHVybiBWYWx1ZTogSF9TVUNDRVNTLCBIX1BhcmFt
ZXRlciwgSF9QMiwgSF9CVVNZCisgKgorICogR2l2ZW4gYSBEUkMgSW5kZXggRmx1c2ggdGhl
IGRhdGEgdG8gYmFja2VuZCBOVkRJTU0gZGV2aWNlLgorICogVGhlIGhjYWxsIHJldHVybnMg
SF9CVVNZIHdoZW4gdGhlIGZsdXNoIHRha2VzIGxvbmdlciB0aW1lIGFuZCB0aGUgaGNhbGwK
PC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj5JdCByZXR1cm5zIG9uZSBvZiB0aGUgSF9MT05HX0JVU1kgdmFsdWVz
LCBub3QgYWN0dWFsIEhfQlVTWSwgZG9lc24ndAppdD8KPC9wcmU+CiAgICA8L2Jsb2NrcXVv
dGU+CiAgICA8cD5ZZXMuIEkgdGhvdWdodCBpdHMgb2theSB0byBjYWxsIGl0IGp1c3QgSF9C
VVNZIGluIGEgZ2VuZXJpYyB3YXkuCiAgICAgIFdpbGwgZml4IGl0LjwvcD4KICAgIDxwPjxi
cj4KICAgIDwvcD4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpZRnFz
OE0xZEhBRmhkQ0w2QHlla2tvLmZyaXR6LmJveCI+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+KyAq
IG5lZWRzIHRvIGJlIGlzc3VlZCBtdWx0aXBsZSB0aW1lcyBpbiBvcmRlciB0byBiZSBjb21w
bGV0ZWx5IHNlcnZpY2VkLgorICAgICAgICB9CisKKyAgICAgICAgcmV0dXJuIHJldDsKKyAg
ICB9CisKKyAgICBkaW1tID0gUENfRElNTShkcmMtJmd0O2Rldik7CisgICAgYmFja2VuZCA9
IE1FTU9SWV9CQUNLRU5EKGRpbW0tJmd0O2hvc3RtZW0pOworCisgICAgc3RhdGUgPSBzcGFw
cl9udmRpbW1faW5pdF9uZXdfZmx1c2hfc3RhdGUoKTsKKyAgICBpZiAoIXN0YXRlKSB7Cisg
ICAgICAgIHJldHVybiBIX1AyOwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkFGQUlDVCB0aGUgb25seSB3YXkg
aW5pdF9uZXdfZmx1c2hfc3RhdGUoKSBmYWlscyBpcyBhIGZhaWx1cmUgaW4gdGhlClJORywg
d2hpY2ggZGVmaW5pdGVseSBpc24ndCBhIHBhcmFtZXRlciBwcm9ibGVtLjwvcHJlPgogICAg
PC9ibG9ja3F1b3RlPgogICAgPHA+V2lsbCBjaGFuZ2UgaXQgdG8gSF9IQVJEV0FSRS4gPGJy
PgogICAgPC9wPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPHA+IDwvcD4KICAgIDxibG9j
a3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpZRnFzOE0xZEhBRmhkQ0w2QHlla2tvLmZy
aXR6LmJveCI+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUg
Y2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+KyAgICB9CisKKyAgICBzdGF0ZS0mZ3Q7
YmFja2VuZF9mZCA9IG1lbW9yeV9yZWdpb25fZ2V0X2ZkKCZhbXA7YmFja2VuZC0mZ3Q7bXIp
Owo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPklzIHRoaXMgZ3VhcmFudGVlZCB0byByZXR1cm4gYSB1c2FibGUg
ZmQgaW4gYWxsIGNvbmZpZ3VyYXRpb25zPzwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAg
PHA+UmlnaHQsIGZvciBtZW1vcnktYmFja2VuZC1yYW0gdGhpcyB3b250IHdvcmsuIEkgdGhp
bmsgd2Ugc2hvdWxkPC9wPgogICAgPHA+bm90IHNldCB0aGUgaGNhbGwtZmx1c2gtcmVxdWly
ZWQgdG9vIGZvciBtZW1vcnktYmFja2VuZC1yYW0uIFdpbGwKICAgICAgZml4IHRoaXMuPGJy
PgogICAgPC9wPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOllGcXM4
TTFkSEFGaGRDTDZAeWVra28uZnJpdHouYm94Ij4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0i
Y2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4rICAg
IHRocmVhZF9wb29sX3N1Ym1pdF9haW8ocG9vbCwgZmx1c2hfd29ya2VyX2NiLCBzdGF0ZSwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwYXByX252ZGltbV9mbHVzaF9jb21wbGV0
aW9uX2NiLCBzdGF0ZSk7CisKKyAgICByZXQgPSBzcGFwcl9udmRpbW1fZ2V0X2ZsdXNoX3N0
YXR1cyhzdGF0ZS0mZ3Q7Y29udGludWVfdG9rZW4pOworICAgIGlmIChIX0lTX0xPTkdfQlVT
WShyZXQpKSB7CisgICAgICAgIGFyZ3NbMF0gPSBzdGF0ZS0mZ3Q7Y29udGludWVfdG9rZW47
CisgICAgfQorCisgICAgcmV0dXJuIHJldDsKPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4K
ICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5JIGJlbGlldmUgeW91
IGNhbiByZWFycmFuZ2UgdGhpcyBzbyB0aGUgZ2V0X2ZsdXNoX3N0YXR1cyAvIGNoZWNrIC8K
cmV0dXJuIGlzIHNoYXJlZCBiZXR3ZWVuIHRoZSBhcmdzWzBdID09IDAgYW5kIGFyZ3NbMF0g
PT0gdG9rZW4gcGF0aHMuPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBva2F5Ljxicj4K
ICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpZRnFzOE0xZEhBRmhkQ0w2
QHlla2tvLmZyaXR6LmJveCI+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5UaGFua3MsPC9w
PgogICAgPHA+U2hpdmE8YnI+CiAgICA8L3A+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--------------7D0D80A72CF417904AF55A0A--


