Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A24F4291
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 23:49:52 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbr3f-0005jC-DH
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 17:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nbr2Y-000520-I1; Tue, 05 Apr 2022 17:48:42 -0400
Received: from smtp44.i.mail.ru ([94.100.177.104]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nbr2V-0005by-Ud; Tue, 05 Apr 2022 17:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=o5b30vK2o9iEW51GnoNoMx+mLjxnnKsL59yp6x5M6xs=; 
 t=1649195320;x=1649800720; 
 b=ujmjKA1ZppZIJ80U8o2G6EqbbzS5lve2eK9HAS/ru2dv1i2tW3bGe9Le6GZ/Kz0GzsHUsv1JbePyIpzcJemlXZ5ntecIp6ppFvQuT83QIm/fSteNlSTs0vO2f50vWk7AjI3Jht1Qo79PBU77tOGVAXWNRTw6Tt9yrXDQJzoTg4isIahFXXvsSN8M9ul7IAx2W9D2XcWw99jK3upxb6MEMTR/1KC7lLu9VAPaBs/OIwOgbDU7KA5gFzfModbJop/n9qE+xosfNhkPWeOF2FOcYvTE4No+VzesnkbWl0QQ77hWcPOFdSrmmoagwkt+WVydhxWihbu29sgwcR73bds3ow==;
Received: by smtp44.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nbr2R-0005H1-S0; Wed, 06 Apr 2022 00:48:36 +0300
Message-ID: <8caf1a06-e3db-38a0-52e1-cff3a9db71d2@mail.ru>
Date: Wed, 6 Apr 2022 00:48:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, eesposit@redhat.com
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com> <303aace0-2545-91a1-ef48-568f74680ca8@mail.ru>
 <YkxVBCbrSa1F9k+S@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <YkxVBCbrSa1F9k+S@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp44.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD90FA8EB11E8F64C5668880C5449ED4B458E6EB3CF4D4DAF50182A05F5380850400C38D4DE5E0DD5A6A60ACD6A4348EA6205FC7DB4304C4794B7E1AF0E00171538
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AE28AD3C7270E452C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7495A032B936E882FEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6362FFDD9D106994B975BB84BCFD4582320879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B97735CB629EEF1311BF91D2E47CDBA5A96583C09775C1D3CA48CF90BCC82C2C62A6D1117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE78C592797616C97AB9FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE74276DBDAD9F19F07D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C06A80B085B5A8AE91CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6A087F0D4B69734CA089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A574D2C5FB4D1E72B1F504CC0ED34C3A23EC3DBB0FB8FBC446D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340A4C04F5DECA7EE97E8632E45ADD53A09EB390BE12358126CCD25545C94B7C59C27A4889112DB4111D7E09C32AA3244CAEAFE28E25210473F69FD02FC9F2ED5AB038C9161EF167A18D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Ye4yGrpcn9bjiGVq4ASBw==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C391398469902F703E5BA20774222FE3FBC4C51D8EB1036290ED7E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.104;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp44.i.mail.ru
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

05.04.2022 17:41, Kevin Wolf wrote:
> Am 05.04.2022 um 14:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Thanks Kevin! I have already run out of arguments in the battle
>> against using subtree-drains to isolate graph modification operations
>> from each other in different threads in the mailing list)
>>
>> (Note also, that the top-most version of this patch is "[PATCH v2]
>> block/stream: Drain subtree around graph change")
> 
> Oops, I completely missed the v2. Thanks!
> 
>> About avoiding polling during graph-modifying operations, there is a
>> problem: some IO operations are involved into block-graph modifying
>> operations. At least it's rewriting "backing_file_offset" and
>> "backing_file_size" fields in qcow2 header.
>>
>> We can't just separate rewriting metadata from graph modifying
>> operation: this way another graph-modifying operation may interleave
>> and we'll write outdated metadata.
> 
> Hm, generally we don't update image metadata when we reconfigure the
> graph. Most changes are temporary (like insertion of filter nodes) and
> the image header only contains a "default configuration" to be used on
> the next start.
> 
> There are only a few places that update the image header; I think it's
> generally block job completions. They obviously update the in-memory
> graph, too, but they don't write to the image file (and therefore
> potentially poll) in the middle of updating the in-memory graph, but
> they do both in separate steps.
> 
> I think this is okay. We must just avoid polling in the middle of graph
> updates because if something else changes the graph there, it's not
> clear any more that we're really doing what the caller had in mind.

Hmm, interesting where is polling in described case?

First possible place I can find is bdrv_parent_drained_begin_single() in bdrv_replace_child_noperm().

Another is bdrv_apply_subtree_drain() in bdrv_child_cb_attach().

No idea how to get rid of them. Hmm.

I think, the core problem here is that when we wait in drained_begin(), nobody protects us from attaching one more node to the drained subgraph. And we should handle this, that's the complexity.

> 
>> So I still think, we need a kind of global lock for graph modifying
>> operations. Or a kind per-BDS locks as you propose. But in this case
>> we need to be sure that taking all needed per-BDS locks we'll avoid
>> deadlocking.
> 
> I guess this depends on the exact granularity of the locks we're using.
> If you take the lock only while updating a single edge, I don't think
> you could easily deadlock. If you hold it for more complex operations,
> it becomes harder to tell without checking the code.
> 

I think, keeping the whole operation, like reopen_multiple, or some job's .prepare(), etc., under one critical section is simplest to analyze.

Could this be something like this?

   uint8_t graph_locked;

   void graph_lock(AioContext *ctx) {
     AIO_POLL_WHILE(ctx, qatomic_cmpxchg(&graph_locked, 0, 1) == 1);
   }

   void graph_unlock() {
     qatomic_set(&graph_locked, 0);
     aio_wait_kick();
   }

-- 
Best regards,
Vladimir

