Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864014E2648
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 13:27:17 +0100 (CET)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWH7z-0003Ho-WA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 08:27:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWH3Z-0001ex-F3; Mon, 21 Mar 2022 08:22:43 -0400
Received: from smtp49.i.mail.ru ([94.100.177.109]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWH3I-0005kG-Fw; Mon, 21 Mar 2022 08:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Vv5pXDyP6ZaVVAZcNozgH7TF1Cywxb+1Syc5PSq/5eQ=; 
 t=1647865344;x=1648470744; 
 b=iWpVYRI1AmFTKLfJVhj2j6W7g8UUbnqTx3rvMhchPaB5z1bStmFuPkeSExNEKI9YX7L1rfjamqZRRElYsrrbM/xgP6JNctSE+PbK5RpNhjOUDXeft9BP+/qf5NIrGjT+zO4miOOpRkATDsbE8W7KG46LfFPfDe7Nz7YVxGCagfY8CylGhelYynzujncCrpl4s7Z2yS0NyMFxCTB/6qxYkHOwrFNqF62ZXT4+1X9K1lRGe9dYtw/GOLWrQnMgiQAIdcljCOvSfOPnjIxcKWQPfK3OzrxSNSGUXyLuinmJmDarCT20bWTJgGwHa+q1gBGoFulHipcPmsSBvg+au/TY8A==;
Received: by smtp49.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWH3E-0000Oi-T2; Mon, 21 Mar 2022 15:22:21 +0300
Message-ID: <9215c4ca-110e-8929-62a0-908d4a3f27b9@mail.ru>
Date: Mon, 21 Mar 2022 15:22:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
 <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
 <e1f1051f-f3bd-9a05-2821-143542d6ff18@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <e1f1051f-f3bd-9a05-2821-143542d6ff18@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp49.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA633AC8158FD68276C79E92F1BB1950288182A05F5380850404C228DA9ACA6FE27B4491ACCD92FCE2F89F3324C1FBE6391E61329B3A92A44C69F2531095DBA3DB7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C6A43EB42C8B28B9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A521848D7B067A388638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F0911625929F0DEF4A2EA79432D5A35E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7BCD80908B360209B9FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BED943DBD20860CC2A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC040E0003A52AFEF73AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006372CCD0B7543C42194D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F443EE40786112381A91E23F1B6B78B78B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5876933C307350DF52A23B8D2755445683DB223C1E4820384D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA7540E9CF2C1C1CEBBA410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34697E0FA301E28215C5EB6A7EBEA1FF555F87E5BE19ADAD9120298016066F68650CA39E4B7E247BA21D7E09C32AA3244CBE603C7BF4EBD4E60BEE9E5916F00F3297FE24653F78E668ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojSLL0ldHQslaBf3y3xflrWQ==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15C90EBE37D31C6C9D44CC60DB2C8E96FEFE377E342BF95D99E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.109;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp49.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

17.03.2022 00:55, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 09/03/2022 um 14:26 schrieb Emanuele Giuseppe Esposito:
>>> Next, I have a problem in mind, that in past lead to a lot of iotest 30
>>> failures. Next there were different fixes and improvements, but the core
>>> problem (as far as I understand) is still here: nothing protects us when
>>> we are in some graph modification process (for example block-job
>>> finalization) do yield, switch to other coroutine and enter another
>>> graph modification process (for example, another block-job finaliztion)..
>> That's another point to consider. I don't really have a solution for this.
>>
> On a side note, that might not be a real problem.
> If I understand correctly, your fear is that we are doing something like
> parent->children[x] = new_node // partial graph operation
> /* yield to another coroutine */
> coroutine reads/writes parent->children[x] and/or new_node->parents[y]
> /* yield back */
> new_node->parents[y] = parent // end of the initial graph operation
> 
> Is that what you are pointing out here?
> If so, is there a concrete example for this? Because yields and drains
> (that eventually can poll) seem to be put either before or after the
> whole graph modification section. In other words, even if a coroutine
> enters, it will be always before or after the _whole_ graph modification
> is performed.
> 

The old example was here: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05212.html  - not sure how much is it applicable now.

Another example - look at bdrv_drop_intermediate() in block.c and at TODO comments in it.

In both cases the problem is we want to update some metadata in qcow2 (backing file name) as part of block-graph modification. But this update does write to qcow2 header which may yield and switch to some another block-graph modification code.


-- 
Best regards,
Vladimir

