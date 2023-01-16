Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4186866CDF1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:51:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTdT-0006rt-UI; Mon, 16 Jan 2023 12:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTdP-0006oz-Iz; Mon, 16 Jan 2023 12:51:05 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTdN-0007qu-U8; Mon, 16 Jan 2023 12:51:03 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPXpS-1p4uYX0H4M-00MgVZ; Mon, 16 Jan 2023 18:50:55 +0100
Message-ID: <5779382f-9f8d-439e-b474-1ac1606d65a5@vivier.eu>
Date: Mon, 16 Jan 2023 18:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Claudio Fontana <cfontana@suse.de>,
 qemu devel list <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, wxhusst@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
 <339b8c7d-1f54-a515-8854-c22d10f79d1d@suse.de>
 <CAMPkWoOFXfyx=ZOv8i6AJ8Lv2GFKt11gnXYZ2W_4roS9UP9m5w@mail.gmail.com>
 <CAC_L=vUD2vVNSaP7UcDuRUCyd8XNmb4iRY_LXK0UNEE-+Rr4TQ@mail.gmail.com>
 <6cd36e7e-dae7-6258-736a-44630cee9010@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <6cd36e7e-dae7-6258-736a-44630cee9010@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BnCFwTYr6spPmi1x3NHeIxeGK1hSqln4kBvkyhP9r/giIwIpLer
 6YDc3Db6xLYrwR41vGGM8+9csOR1dUvn383nsSNziXDtbcGfSoRkOS5gL8EAmGDP473DIjx
 WN9dmbZA9nRvhV704YIeqd1QR4Pk1xyTips64cSuj+XForrDAtZWiSkIOaq7ecGz9ubeSgs
 Z67jHIvWsOXeFuq/v+gcw==
UI-OutboundReport: notjunk:1;M01:P0:5ofr3XoCD80=;WSuLp/X075elb172bdbH61+VCrL
 oMw8ptscoSEAnFdbUAGi2bgH1i+q6/fYlubejxyhXtEVCqMHt+/e5LUHG3kmmNpAT8lOeiBdS
 Tu4CBWHHg/x+wzcakg4iCGoDLlmzwRCXi/exLuybubdI+MJ3MgaLFG21gvmZJ7i0xJv8iGdh6
 PuETxsstWRYYh82XHotId3qY+7NA4aiAwSNRaz27WdOBycMFwhwPYdkg5M5Yqs2aHdVnnQuBf
 rhpV2RCY21EWLewZWRbUu+dfU7jX/QvNuUAC3QN4dpC0FuQytzasdWQ79M0p4uNcOJ0BwWOU0
 JPniCKf81c92yZCPEvIqmocsa2QInSiiXJh9TefKQ8Osn4HQ2oJpWA6f0SujU3+eYMnyKj9GI
 uBmV8ECdXp174WkuF/SWZJc7dLuWJjvZ7J13XBDT+gg5e7ZREH+Qjnb2mgfBOXQpFQBYrwMlY
 fuu63CvYNrEM5cEyHwy35ndK2QQCM+ziTXB/oXyhEXcaghYKEP/eYSKHGez+HXyLAp1QzpWIW
 1/aZFLhwx2rq+T8gfrVpGO4xQH5TQXLyNv5E2H1g+SO3/YaFG8h3/ZPj2Q0YaiCsPFutG/hCk
 dwpZu7CDuysvdJhnyinmrWvvtStXB7vckqswsoW3tciyvGmdDqWxqAT80xj308cFSVmHUBVK2
 h3DC/j+T4aY4gh/mxKW3rk0sHX9AHucJtTmfggnQjg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 28/12/2022 à 20:32, Thomas Huth a écrit :
> On 19/12/2022 12.21, Marcel Apfelbaum wrote:
>> On Mon, Dec 19, 2022 at 10:57 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>>
>>> Can anyone else pick this one?
>>
>> Adding Thomas,
>>
>> I dropped the ball with this one, I am sorry about that, maybe it
>> doesn't worth a Pull Request only for it.
> 
> Why not? Pull request for single patches aren't that uncommon.
> 
>> Maybe it can go through the Misc tree?
> 
> hw/rdma/ is really not my turf, but since the patch is small, it sounds like a good candidate for 
> qemu-trivial, I think.

Applied to my trivial-patches branch.

Thanks,
Laurent

> 
>   Thomas
> 
> 
>>> On Wed, 7 Dec 2022 at 17:05, Claudio Fontana <cfontana@suse.de> wrote:
>>>>
>>>> On 4/5/22 12:31, Marcel Apfelbaum wrote:
>>>>> Hi Yuval,
>>>>> Thank you for the changes.
>>>>>
>>>>> On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>>>>>
>>>>>> Guest driver might execute HW commands when shared buffers are not yet
>>>>>> allocated.
>>>>>> This could happen on purpose (malicious guest) or because of some other
>>>>>> guest/host address mapping error.
>>>>>> We need to protect againts such case.
>>>>>>
>>>>>> Fixes: CVE-2022-1050
>>>>>>
>>>>>> Reported-by: Raven <wxhusst@gmail.com>
>>>>>> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>>>>>> ---
>>>>>> v1 -> v2:
>>>>>>          * Commit message changes
>>>>>> v2 -> v3:
>>>>>>          * Exclude cosmetic changes
>>>>>> ---
>>>>>>   hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>>>>>>   1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>>>>>> index da7ddfa548..89db963c46 100644
>>>>>> --- a/hw/rdma/vmw/pvrdma_cmd.c
>>>>>> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>>>>>> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>>>>>>
>>>>>>       dsr_info = &dev->dsr_info;
>>>>>>
>>>>>> +    if (!dsr_info->dsr) {
>>>>>> +            /* Buggy or malicious guest driver */
>>>>>> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
>>>>>> +            goto out;
>>>>>> +    }
>>>>>> +
>>>>>>       if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>>>>>>                         sizeof(struct cmd_handler)) {
>>>>>>           rdma_error_report("Unsupported command");
>>>>>> -- 
>>>>>> 2.20.1
>>>>>>
>>>>>
>>>>> cc-ing Peter and Philippe for a question:
>>>>> Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
>>>>> have to wait a week or so.
>>>>>
>>>>> Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>>>> Thanks,
>>>>> Marcel
>>>>>
>>>>
>>>> Hi all,
>>>>
>>>> patch is reviewed, anything holding back the inclusion of this security fix?
>>>>
>>>> Thanks,
>>>>
>>>> Claudio
>>
> 
> 


