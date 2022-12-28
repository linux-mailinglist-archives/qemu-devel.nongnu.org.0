Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D6658671
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 20:34:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAcAJ-0000We-Tb; Wed, 28 Dec 2022 14:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAcA4-0000WR-MQ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 14:32:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAcA2-0006l2-TV
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 14:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672255941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=142198HEzvZ/6B0fkFKSXEo1rKqVVe9NcGrG45nJG8A=;
 b=BAtDY9Rk6DDoTHy26Eq7zCYHNOyTUMJf/ROOCcwDowhEeGuX+D92qlRNQilH5a85ikHBkR
 TWGHh5LosiJT8hzEL9qQbJ6S+D5Pjv30kQNbdGomDroen+BAvoEeLVJxccHDna9ODD+UIW
 8o5ChYnIpkWnfVlnRTRCUvhiw9k39AU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-WCQsVY6nO5Gj1VQoUNjFkw-1; Wed, 28 Dec 2022 14:32:19 -0500
X-MC-Unique: WCQsVY6nO5Gj1VQoUNjFkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so11539331wma.0
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 11:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=142198HEzvZ/6B0fkFKSXEo1rKqVVe9NcGrG45nJG8A=;
 b=aK6GbrtphbEzAi9Q9PouSac8PzAjXU5Y1eH/a/wazk13YPph+FttV1DOAg77pCtWMQ
 8CIcPcDlOSU8w4V1ZmtzD/eQ1Fr9V2917I6Lspl6DkHjG4+fwlYfWZCR5p4HFabY3lb0
 YXytQ6cAfCWEkkOLId1DtqeuspczY8z6Rz+eDsP9aMBVg74B5IZkZSu+uGL1gV8dra7/
 XhQbwCOXNCkcnq0PqVGKOSwiw+MpLdYiNueHfeNKl2r8ePAGQpn7wa9onIY7Bv8xsd78
 tQ0HxgkJq5KVQsPC2K7vKGIgtZJ77QnhMutdX+UkSJ/RqivQ/uZWqHxRzanT/tPTj5Sm
 fE5g==
X-Gm-Message-State: AFqh2kp5mdo0CDwkluf40WnF8cQ2cxdfQ7l7JyPEmTv6CCDekioNzM/T
 3xJ/4iT0lEzq4jdL7hbXLG6pI+zp3/XbhCpjwtqjsQbxXlTsDV3URpqMlNjkKOqeje/EX+f2YTd
 nxGzeT3MIRoAeeL4=
X-Received: by 2002:adf:f4c1:0:b0:27e:7f5:6634 with SMTP id
 h1-20020adff4c1000000b0027e07f56634mr6898528wrp.60.1672255938816; 
 Wed, 28 Dec 2022 11:32:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXttxRlmz1AaO6ButbiNgP8QAIhIgXd8QUqetGf6Ce04vOkw1LivuwXhw0+6+3wVnAYQ56mk7Q==
X-Received: by 2002:adf:f4c1:0:b0:27e:7f5:6634 with SMTP id
 h1-20020adff4c1000000b0027e07f56634mr6898510wrp.60.1672255938453; 
 Wed, 28 Dec 2022 11:32:18 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003d98a7aa12csm8232963wmg.16.2022.12.28.11.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 11:32:17 -0800 (PST)
Message-ID: <6cd36e7e-dae7-6258-736a-44630cee9010@redhat.com>
Date: Wed, 28 Dec 2022 20:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
Content-Language: en-US
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAC_L=vUD2vVNSaP7UcDuRUCyd8XNmb4iRY_LXK0UNEE-+Rr4TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/12/2022 12.21, Marcel Apfelbaum wrote:
> On Mon, Dec 19, 2022 at 10:57 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>
>> Can anyone else pick this one?
> 
> Adding Thomas,
> 
> I dropped the ball with this one, I am sorry about that, maybe it
> doesn't worth a Pull Request only for it.

Why not? Pull request for single patches aren't that uncommon.

> Maybe it can go through the Misc tree?

hw/rdma/ is really not my turf, but since the patch is small, it sounds like 
a good candidate for qemu-trivial, I think.

  Thomas


>> On Wed, 7 Dec 2022 at 17:05, Claudio Fontana <cfontana@suse.de> wrote:
>>>
>>> On 4/5/22 12:31, Marcel Apfelbaum wrote:
>>>> Hi Yuval,
>>>> Thank you for the changes.
>>>>
>>>> On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>>>>
>>>>> Guest driver might execute HW commands when shared buffers are not yet
>>>>> allocated.
>>>>> This could happen on purpose (malicious guest) or because of some other
>>>>> guest/host address mapping error.
>>>>> We need to protect againts such case.
>>>>>
>>>>> Fixes: CVE-2022-1050
>>>>>
>>>>> Reported-by: Raven <wxhusst@gmail.com>
>>>>> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>>>>> ---
>>>>> v1 -> v2:
>>>>>          * Commit message changes
>>>>> v2 -> v3:
>>>>>          * Exclude cosmetic changes
>>>>> ---
>>>>>   hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>>>>>   1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>>>>> index da7ddfa548..89db963c46 100644
>>>>> --- a/hw/rdma/vmw/pvrdma_cmd.c
>>>>> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>>>>> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>>>>>
>>>>>       dsr_info = &dev->dsr_info;
>>>>>
>>>>> +    if (!dsr_info->dsr) {
>>>>> +            /* Buggy or malicious guest driver */
>>>>> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
>>>>> +            goto out;
>>>>> +    }
>>>>> +
>>>>>       if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>>>>>                         sizeof(struct cmd_handler)) {
>>>>>           rdma_error_report("Unsupported command");
>>>>> --
>>>>> 2.20.1
>>>>>
>>>>
>>>> cc-ing Peter and Philippe for a question:
>>>> Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
>>>> have to wait a week or so.
>>>>
>>>> Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>>> Thanks,
>>>> Marcel
>>>>
>>>
>>> Hi all,
>>>
>>> patch is reviewed, anything holding back the inclusion of this security fix?
>>>
>>> Thanks,
>>>
>>> Claudio
> 


