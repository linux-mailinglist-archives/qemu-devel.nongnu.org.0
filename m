Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC94F2F6F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 14:14:43 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbi54-0006SK-1q
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 08:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nbi32-0005ZG-2h; Tue, 05 Apr 2022 08:12:36 -0400
Received: from smtp61.i.mail.ru ([217.69.128.41]:49922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nbi2y-00054C-Gh; Tue, 05 Apr 2022 08:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=J5ZJnoXksHJLt6EGJhF98+McbxcZS4JZkmtKTrhCai0=; 
 t=1649160752;x=1649766152; 
 b=BL+qTNXtZ1/r3THoS/vZvqUeZB/QJykQxN3JvswGqRJaYmVm/0ZkNeDoWpVrRcFrDK8Rtbgk46WfmNKybkY88/Ponp2Amt0w719ZCze9E3Dizheb4oI5YbIiJ8CpZSzBwK/Qs5nwfCu5/5TAE/rn29zgPO/ElLjBuXCZwdNSaXePfGbj+JX8JP3L0VF4vRGjevmdXJ6ZgcdqGTv8nI0pjuxbAqR0f5y9IZ6NQzue9RtvFG2li0FwgmVfvjK4wxIUw7XugDj5C61jPrq5NG0PtGVr3Lz1f4Q2vji0EJseSmQ2/NLb8lpKj5Bt53ShI4z7OFHc5rzEW1MvIPaJJ+6EfA==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nbi2t-00035e-U5; Tue, 05 Apr 2022 15:12:28 +0300
Message-ID: <303aace0-2545-91a1-ef48-568f74680ca8@mail.ru>
Date: Tue, 5 Apr 2022 15:12:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow
 <jsnow@redhat.com>, eesposit@redhat.com
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <YkwWbAoYmkVuHlQA@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp61.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD96DC212D1D15EACC480779886B809EA53185CC62502E0CE59182A05F5380850404C228DA9ACA6FE27FD7FBE1320C2966D39B1A3D5535B3D6BCCAA7DE94476EE95E03A9EA86E704229
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CB1634DB9A2F7B99EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370BEBC60587DC626C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D855662E780000EFD7443729D435A121DE6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7089B44B3323BCBA59FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC908CD1B87A134A2A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC4AFA663C125B16563AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637680EBFFB4C5F2977D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F249797B4B1AC144942539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A548D3A643DC16DEE58B8AC7E6F0B4CF358C9A9A973B6AB3B9D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349C39CCCDAABCB54B776DAE9528F5F8ECF519188B9DAE93F1E56F5AB9043B283ABB6CC6DF7AAD4C8D1D7E09C32AA3244CB4A5B86EA3DB292A62AE7E816F4E113905AB220A9D022EBC8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Ye4yGrpcn/CPgTfF6YI8g==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE86493470BF28A1447DC7A700879FED0D2CADFABBE525F35EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.41;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp61.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

05.04.2022 13:14, Kevin Wolf wrote:
> Am 24.03.2022 um 13:57 hat Hanna Reitz geschrieben:
>> When the stream block job cuts out the nodes between top and base in
>> stream_prepare(), it does not drain the subtree manually; it fetches the
>> base node, and tries to insert it as the top node's backing node with
>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
>> the actual base node might change (because the base node is actually not
>> part of the stream job) before the old base node passed to
>> bdrv_set_backing_hd() is installed.
>>
>> This has two implications:
>>
>> First, the stream job does not keep a strong reference to the base node.
>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>> because some other block job is drained to finish), we will get a
>> use-after-free.  We should keep a strong reference to that node.
>>
>> Second, even with such a strong reference, the problem remains that the
>> base node might change before bdrv_set_backing_hd() actually runs and as
>> a result the wrong base node is installed.
>>
>> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
>> case, which has five nodes, and simultaneously streams from the middle
>> node to the top node, and commits the middle node down to the base node.
>> As it is, this will sometimes crash, namely when we encounter the
>> above-described use-after-free.
>>
>> Taking a strong reference to the base node, we no longer get a crash,
>> but the resuling block graph is less than ideal: The expected result is
>> obviously that all middle nodes are cut out and the base node is the
>> immediate backing child of the top node.  However, if stream_prepare()
>> takes a strong reference to its base node (the middle node), and then
>> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
>> that middle node, the stream job will just reinstall it again.
>>
>> Therefore, we need to keep the whole subtree drained in
>> stream_prepare()
> 
> That doesn't sound right. I think in reality it's "if we take the really
> big hammer and drain the whole subtree, then the bit that we really need
> usually happens to be covered, too".
> 
> When you have a long backing chain and merge the two topmost overlays
> with streaming, then it's none of the stream job's business whether
> there is I/O going on for the base image way down the chain. Subtree
> drains do much more than they should in this case.
> 
> At the same time they probably do too little, because what you're
> describing you're protecting against is not I/O, but graph modifications
> done by callbacks invoked in the AIO_WAIT_WHILE() when replacing the
> backing file. The callback could be invoked by I/O on an entirely
> different subgraph (maybe if the other thing is a mirror job) or it
> could be a BH or anything else really. bdrv_drain_all() would increase
> your chances, but I'm not sure if even that would be guaranteed to be
> enough - because it's really another instance of abusing drain for
> locking, we're not really interested in the _I/O_ of the node.
> 
>> so that the graph modification it performs is effectively atomic,
>> i.e. that the base node it fetches is still the base node when
>> bdrv_set_backing_hd() sets it as the top node's backing node.
> 
> I think the way to keep graph modifications atomic is avoid polling in
> the middle. Not even running any callbacks is a lot safer than trying to
> make sure there can't be undesired callbacks that want to run.
> 
> So probably adding drain (or anything else that polls) in
> bdrv_set_backing_hd() was a bad idea. It could assert that the parent
> node is drained, but it should be the caller's responsibility to do so.
> 
> What streaming completion should look like is probably something like
> this:
> 
>      1. Drain above_base, this also drains all parents up to the top node
>         (needed because in-flight I/O using an edge that is removed isn't
>         going to end well)
> 
>      2. Without any polling involved:
>          a. Find base (it can't change without polling)
>          b. Update top->backing to point to base
> 
>      3. End of drain.
> 
> You don't have to keep extra references or deal with surprise removals
> of nodes because the whole thing is atomic when you don't poll. Other
> threads can't interfere either because graph modification requires the
> BQL.
> 
> There is no reason to keep base drained because its I/O doesn't
> interfere with the incoming edge that we're changing.
> 
> I think all of this is really relevant for Emanuele's work, which
> involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
> fully expect that we would see very similar problems, and just stacking
> drain sections over drain sections that might happen to usually fix
> things, but aren't guaranteed to, doesn't look like a good solution.
> 

Thanks Kevin! I have already run out of arguments in the battle against using subtree-drains to isolate graph modification operations from each other in different threads in the mailing list)

(Note also, that the top-most version of this patch is "[PATCH v2] block/stream: Drain subtree around graph change")


About avoiding polling during graph-modifying operations, there is a problem: some IO operations are involved into block-graph modifying operations. At least it's rewriting "backing_file_offset" and "backing_file_size" fields in qcow2 header.

We can't just separate rewriting metadata from graph modifying operation: this way another graph-modifying operation may interleave and we'll write outdated metadata.


So I still think, we need a kind of global lock for graph modifying operations. Or a kind per-BDS locks as you propose. But in this case we need to be sure that taking all needed per-BDS locks we'll avoid deadlocking.



-- 
Best regards,
Vladimir

