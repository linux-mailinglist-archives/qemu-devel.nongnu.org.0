Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF44144926
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 01:58:49 +0100 (CET)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu4M4-00045B-GU
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 19:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1iu4LM-0003gj-Lu
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 19:58:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1iu4LL-0000ct-Bm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 19:58:04 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:32479
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1iu4LL-0000c9-0x
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 19:58:03 -0500
X-IronPort-AV: E=Sophos;i="5.70,347,1574092800"; d="scan'208";a="82358847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jan 2020 08:57:57 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id AFE135010EC0;
 Wed, 22 Jan 2020 08:48:45 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 22 Jan 2020 08:57:57 +0800
Message-ID: <5E279E13.5000405@cn.fujitsu.com>
Date: Wed, 22 Jan 2020 08:57:55 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 006/104] virtiofsd: Trim down imported files
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-7-dgilbert@redhat.com>
 <5E26CB57.7060804@cn.fujitsu.com> <20200121105148.GC2929@work-vm>
In-Reply-To: <20200121105148.GC2929@work-vm>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AFE135010EC0.A9B8A
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/1/21 18:51, Dr. David Alan Gilbert wrote:
> * Xiao Yang (yangx.jy@cn.fujitsu.com) wrote:
>> On 2019/12/13 0:37, Dr. David Alan Gilbert (git) wrote:
>>> -	res = fuse_buf_copy(&pipe_buf, buf,
>>> -			    FUSE_BUF_FORCE_SPLICE | FUSE_BUF_SPLICE_NONBLOCK);
>>> -	if (res<   0) {
>>> -		if (res == -EAGAIN || res == -EINVAL) {
>>> -			/*
>>> -			 * Should only get EAGAIN on kernels with
>>> -			 * broken SPLICE_F_NONBLOCK support (<=
>>> -			 * 2.6.35) where this error or a short read is
>>> -			 * returned even if the pipe itself is not
>>> -			 * full
>>> -			 *
>>> -			 * EINVAL might mean that splice can't handle
>>> -			 * this combination of input and output.
>>> -			 */
>>> -			if (res == -EAGAIN)
>>> -				se->broken_splice_nonblock = 1;
>>> -
>>> -			pthread_setspecific(se->pipe_key, NULL);
>>> -			fuse_ll_pipe_free(llp);
>>> -			goto fallback;
>>> -		}
>>> -		res = -res;
>>> -		goto clear_pipe;
>>> -	}
>>> -
>>> -	if (res != 0&&   res<   len) {
>>> -		struct fuse_bufvec mem_buf = FUSE_BUFVEC_INIT(len);
>>> -		void *mbuf;
>>> -		size_t now_len = res;
>>> -		/*
>>> -		 * For regular files a short count is either
>>> -		 *  1) due to EOF, or
>>> -		 *  2) because of broken SPLICE_F_NONBLOCK (see above)
>>> -		 *
>>> -		 * For other inputs it's possible that we overflowed
>>> -		 * the pipe because of small buffer fragments.
>>> -		 */
>>> -
>>> -		res = posix_memalign(&mbuf, pagesize, len);
>>> -		if (res != 0)
>>> -			goto clear_pipe;
>>> -
>>> -		mem_buf.buf[0].mem = mbuf;
>>> -		mem_buf.off = now_len;
>>> -		res = fuse_buf_copy(&mem_buf, buf, 0);
>>> -		if (res>   0) {
>>> -			char *tmpbuf;
>>> -			size_t extra_len = res;
>>> -			/*
>>> -			 * Trickiest case: got more data.  Need to get
>>> -			 * back the data from the pipe and then fall
>>> -			 * back to regular write.
>>> -			 */
>>> -			tmpbuf = malloc(headerlen);
>>> -			if (tmpbuf == NULL) {
>>> -				free(mbuf);
>>> -				res = ENOMEM;
>>> -				goto clear_pipe;
>>> -			}
>>> -			res = read_back(llp->pipe[0], tmpbuf, headerlen);
>>> -			free(tmpbuf);
>>> -			if (res != 0) {
>>> -				free(mbuf);
>>> -				goto clear_pipe;
>>> -			}
>>> -			res = read_back(llp->pipe[0], mbuf, now_len);
>>> -			if (res != 0) {
>>> -				free(mbuf);
>>> -				goto clear_pipe;
>>> -			}
>>> -			len = now_len + extra_len;
>>> -			iov[iov_count].iov_base = mbuf;
>>> -			iov[iov_count].iov_len = len;
>>> -			iov_count++;
>>> -			res = fuse_send_msg(se, ch, iov, iov_count);
>>> -			free(mbuf);
>>> -			return res;
>>> -		}
>>> -		free(mbuf);
>>> -		res = now_len;
>>> -	}
>>> -	len = res;
>>> -	out->len = headerlen + len;
>>> -
>>> -	if (se->debug) {
>>> -		fuse_log(FUSE_LOG_DEBUG,
>>> -			"   unique: %llu, success, outsize: %i (splice)\n",
>>> -			(unsigned long long) out->unique, out->len);
>>> -	}
>>> -
>>> -	splice_flags = 0;
>>> -	if ((flags&   FUSE_BUF_SPLICE_MOVE)&&
>>> -	    (se->conn.want&   FUSE_CAP_SPLICE_MOVE))
>>> -		splice_flags |= SPLICE_F_MOVE;
>>> -
>>> -	res = splice(llp->pipe[0], NULL, ch ? ch->fd : se->fd,
>>> -		     NULL, out->len, splice_flags);
>> Hi,
>>
>> 1) In buffer.c, fuse_buf_splice() uses splice(2) to copy/move data in some
>> cases if the syscall is supported.
>> 2) One pipe needs to be passed to splice(2) so splice(2) without one pipe
>> fails and then go back to use other ways(e.g. use fuse_buf_fd_to_fd()).
>> 3) fuse_buf_copy() calls fuse_buf_splice() indirectly and this patch has
>> removed all pipes used by fuse_buf_copy().
>>
>> Is it necessary to leave the code related to splice(2)?  Is it going to be
>> used in future?
>> We have to use splice(2) by the correct CONFIG_SPLICE macro If necessary.
> Yes, I think we never set HAVE_SPLICE; so that code can go.
> I'll change this patch to remove that as well.
>
Hi Dave,

Agreed.
Reviewed-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Best Regards,
Xiao Yang
> Dave
>
>> Best Regards,
>> Xiao Yang
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>
>
> .
>




