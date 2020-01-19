Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB3141D00
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jan 2020 09:36:47 +0100 (CET)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1it64c-0003Nb-1U
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 03:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1it63c-0002xX-RQ
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 03:35:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1it63b-0004JJ-J6
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 03:35:44 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:24913
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1it63b-0004Ip-8S
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 03:35:43 -0500
X-IronPort-AV: E=Sophos;i="5.70,337,1574092800"; d="scan'208";a="82261365"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 16:35:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 0798A5010EB2;
 Sun, 19 Jan 2020 16:26:31 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 16:35:38 +0800
Message-ID: <5E2414D8.8080601@cn.fujitsu.com>
Date: Sun, 19 Jan 2020 16:35:36 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 105/104] virtiofsd: Unref old/new inodes with the same
 mutex lock in lo_rename()
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20200117133257.16906-1-philmd@redhat.com>
In-Reply-To: <20200117133257.16906-1-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0798A5010EB2.AC3CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 183.91.158.132
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
Cc: Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org, stefanha@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/1/17 21:32, Philippe Mathieu-Daudé wrote:
> We can unref both old/new inodes with the same mutex lock.
>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
> Based-on:<20191212163904.159893-1-dgilbert@redhat.com>
> "virtiofs daemon"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg664652.html
>
>   tools/virtiofsd/passthrough_ll.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 57f58aef26..5c717cb5a1 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1461,8 +1461,10 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
>       }
>
>   out:
> -    unref_inode_lolocked(lo, oldinode, 1);
> -    unref_inode_lolocked(lo, newinode, 1);
> +    pthread_mutex_lock(&lo->mutex);
> +    unref_inode(lo, oldinode, 1);
> +    unref_inode(lo, newinode, 1);
> +    pthread_mutex_unlock(&lo->mutex);
Hi,

It seems to avoid calling pthread_mutex_lock and pthread_mutex_unlock twice.
Does the change fix some issues or improve the performance?

Best Regards,
Xiao Yang
>       lo_inode_put(lo,&oldinode);
>       lo_inode_put(lo,&newinode);
>       lo_inode_put(lo,&parent_inode);




