Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A85B4E790F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 17:39:15 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXmy1-0003Mf-Pz
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 12:39:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nXmwx-0002YD-FR; Fri, 25 Mar 2022 12:38:07 -0400
Received: from smtp30.i.mail.ru ([94.100.177.90]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nXmwu-0003E0-0J; Fri, 25 Mar 2022 12:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DxUCFuOOcq+/fqT9xRisjxUXNlRhzLGB/giiqKrHRyY=; 
 t=1648226284;x=1648831684; 
 b=r6k14IPb8baPf2QypHYVo0l04eeUsw+FnM7juPgVlqcQYQXOr8PTRRy747/RMeXySEl9UZGVj1hmzTuJgFRioqrWqHekWdRD104Sh18M2clvzF3uhwS+7mNuhApgJ2iZwIXZhDDvH9UqZZIqGCMsmpNSml3RvHCAgCud2Cud00JENS5jWpnU9kJUHyla/cTLnNUQytA9qP6JIiBJZSWbTiRMW09cD1lUjyMVbApb/luOj1xkBLa9xW9b7juKDCh9rJ8VwQk17pL//Ag2ybEZS03C/2YwPxRCrZzoE3fZIy3ppkrg5kzfNZpJSpBt4GqBOXRuJLWalyYh1v34W9jm0Q==;
Received: by smtp30.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nXmwo-0007ax-8j; Fri, 25 Mar 2022 19:37:58 +0300
Message-ID: <7da3445c-7417-6329-c9e3-4488ab7a96ec@mail.ru>
Date: Fri, 25 Mar 2022 19:37:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220324140907.17192-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220324140907.17192-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp30.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD99E4E844CD0404D79B9F85D5ED3ED71CC11FF2F23F471849A182A05F5380850404C228DA9ACA6FE2722D442308AAD5118FF5ADA20709BE027AA5321804EBEC5FD7DA14FBA07BD844D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7978947DCA0D4215FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CD8995A08F41566CEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6C31C3F8CEED95223243FC4B83D3E1F7E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0F04B652EEC242312D2E47CDBA5A96583C09775C1D3CA48CFCA5A41EBD8A3A0199FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3E478A468B35FE767117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF695841B958ECF675BA3038C0950A5D36C8A9BA7A39EFB766EC990983EF5C0329BA3038C0950A5D36D5E8D9A59859A8B6A1362912412C4C3276E601842F6C81A1F004C906525384307823802FF610243DF43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C55CB31F7A032693E43847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5A5C7018071C91D49384E25F6468308FDE00CDE81A8773CDED59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C786159FDC4342B09C884915261B1EB30EBB6D646653AB7E09424A835EF16F53887345948315B58D1D7E09C32AA3244C19A741C2A028E727D15726F0DF45717E1E098CBE561D6343DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEEP7XBRAbScRD0A+ZEIT9w==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F1525AE4E9356B1CA0470DA597B2C9DD8EC54C8EF9622D1B5C5E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.90;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp30.i.mail.ru
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

24.03.2022 17:09, Hanna Reitz wrote:
> When the stream block job cuts out the nodes between top and base in
> stream_prepare(), it does not drain the subtree manually; it fetches the
> base node, and tries to insert it as the top node's backing node with
> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
> the actual base node might change (because the base node is actually not
> part of the stream job) before the old base node passed to
> bdrv_set_backing_hd() is installed.
> 
> This has two implications:
> 
> First, the stream job does not keep a strong reference to the base node.
> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
> because some other block job is drained to finish), we will get a
> use-after-free.  We should keep a strong reference to that node.
> 
> Second, even with such a strong reference, the problem remains that the
> base node might change before bdrv_set_backing_hd() actually runs and as
> a result the wrong base node is installed.

Hmm.

So, we don't really need a strong reference, as if it helps to avoid some use-after-free, it means that we'll finish up with wrong block graph..

Graph modifying operations must be somehow isolated from each other.

> 
> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
> case, which has five nodes, and simultaneously streams from the middle
> node to the top node, and commits the middle node down to the base node.
> As it is, this will sometimes crash, namely when we encounter the
> above-described use-after-free.
> 
> Taking a strong reference to the base node, we no longer get a crash,
> but the resuling block graph is less than ideal: The expected result is
> obviously that all middle nodes are cut out and the base node is the
> immediate backing child of the top node.  However, if stream_prepare()
> takes a strong reference to its base node (the middle node), and then
> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
> that middle node, the stream job will just reinstall it again.
> 
> Therefore, we need to keep the whole subtree drained in
> stream_prepare(), so that the graph modification it performs is
> effectively atomic, i.e. that the base node it fetches is still the base
> node when bdrv_set_backing_hd() sets it as the top node's backing node.

Emanuele has similar idea of isolating graph changes from each other by subtree-drain.

If I understand correctly the idea is that we'll drain all other block jobs, so the wouldn't do their block-graph modification during drained section. So, we can safely modify the graph.

I don't like this idea:

1. drained section = stop IO. But we don't need to stop IO in the whole subtree to do a needed block-graph modification.

2. Drained section is not a lock, several clients may drain same set of nodes.. So we exploit the fact that concurrent clients will be paused by drained section and don't proceed to graph-modification code.. But are we sure that block-jobs are (and will be?) the only concurrent block-graph modifying clients? Can qmp commands interleave somehow? Can some jobs from other subtree start a block-graph modification that touches our subtree? If go this way, that would be more safe to drain the whole block-graph on any block-graph modification..

I think we'd better have a separate global mechanism for isolating graph modifications. Something like a global co-mutex or queue, where clients waits for their turn in block graph modifications.

Here is my old proposal on that topic: https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/

> 
> Verify this by asserting in said 030's test case that the base node is
> always the top node's immediate backing child when both jobs are done.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v2:
> - Oops, the base can be NULL.  Would have noticed if I had ran all test
>    cases from 030, and not just test_overlapping_5()...
>    That means that keeping a strong reference to the base node must be
>    conditional, based on whether there even is a base node or not.
>    (I mean, technically we do not even need to keep a strong reference to
>    that node, given that we are in a drained section, but I believe it is
>    better style to do it anyway.)
> ---
>   block/stream.c         | 15 ++++++++++++++-
>   tests/qemu-iotests/030 |  5 +++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 3acb59fe6a..694709bd25 100644
> --- a/block/stream.c
> +++ b/block/stream.c
> @@ -64,7 +64,13 @@ static int stream_prepare(Job *job)
>       bdrv_cor_filter_drop(s->cor_filter_bs);
>       s->cor_filter_bs = NULL;
>   
> +    bdrv_subtree_drained_begin(s->above_base);
> +
>       base = bdrv_filter_or_cow_bs(s->above_base);
> +    if (base) {
> +        bdrv_ref(base);
> +    }
> +
>       unfiltered_base = bdrv_skip_filters(base);
>   
>       if (bdrv_cow_child(unfiltered_bs)) {
> @@ -75,14 +81,21 @@ static int stream_prepare(Job *job)
>                   base_fmt = unfiltered_base->drv->format_name;
>               }
>           }
> +
>           bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
>           ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
>           if (local_err) {
>               error_report_err(local_err);
> -            return -EPERM;
> +            ret = -EPERM;
> +            goto out;
>           }
>       }
>   
> +out:
> +    if (base) {
> +        bdrv_unref(base);
> +    }
> +    bdrv_subtree_drained_end(s->above_base);
>       return ret;
>   }
>   
> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
> index 567bf1da67..14112835ed 100755
> --- a/tests/qemu-iotests/030
> +++ b/tests/qemu-iotests/030
> @@ -436,6 +436,11 @@ class TestParallelOps(iotests.QMPTestCase):
>           self.vm.run_job(job='node4', auto_dismiss=True)
>           self.assert_no_active_block_jobs()
>   
> +        # Assert that node0 is now the backing node of node4
> +        result = self.vm.qmp('query-named-block-nodes')
> +        node4 = next(node for node in result['return'] if node['node-name'] == 'node4')
> +        self.assertEqual(node4['image']['backing-image']['filename'], self.imgs[0])
> +
>       # Test a block-stream and a block-commit job in parallel
>       # Here the stream job is supposed to finish quickly in order to reproduce
>       # the scenario that triggers the bug fixed in 3d5d319e1221 and 1a63a907507


-- 
Best regards,
Vladimir

