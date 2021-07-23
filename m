Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B781F3D320B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 04:50:46 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6lGv-0005VO-AZ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 22:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6lFs-0004pn-EM
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 22:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6lFp-0001aN-Fj
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 22:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627008576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/5UgVqlidxPkxyOGYJi4g0WzB0m1GwlfnmxxFlmFsY=;
 b=ivtnQBM7l2GoxLILePu7IIkq29643+mJhkATQwFGKYmTeADazCXXrcXP6rCdAMIzHTa6YH
 cteWI/pgZ3ILJxlPHyLb2D7Wd4PGVESA3ZoAuJ0HzsAZIx42srJl1Z7ZkDLySnjoXdGBSz
 O2iCH3ddSetx5wd/QLm5W9sz9t/CO24=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-mkowEWIPN52iWjzRiMju6A-1; Thu, 22 Jul 2021 22:49:33 -0400
X-MC-Unique: mkowEWIPN52iWjzRiMju6A-1
Received: by mail-pl1-f199.google.com with SMTP id
 x14-20020a170902ec8eb029012bb183b35cso1114068plg.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 19:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g/5UgVqlidxPkxyOGYJi4g0WzB0m1GwlfnmxxFlmFsY=;
 b=Z9JeAqPGj+OvwZWBk0JauLjXZSllVV+3y6wuiUN0iuPyymBulBcZbX+fol2GCLY5/r
 UnZU8Hykr+NUPYgLq0ySSbFw/dnrTKQq2S3EEF3t0HCt5pn9bj0QDVY+ztoQCJBHatnM
 EJl/1D+jMqvD3l9705oAeGy3U+1nUhENMWWzQiaWt274PmNi+G/cFtP7VwbTqRg0IpXn
 jQtZ5QIj8zngb/Tuwfja435iIM/HhYwKDwYjci9hQZSx2w+SmiKQqG795ZJL42XcDPLp
 0DLcu+7lGESt2/wwvwU6DknwPLYZRL55hzOiA4NVZgOTI4jsLNSz4AUBv4zwpN7a0xP+
 ADAQ==
X-Gm-Message-State: AOAM53013PKnrWRrHDgQILumh8QNC3onuiI2vQmUfPy8zcI+MTS479rH
 lThKgy7vJ/3qsjMeoa5ujKOFMWtXW4P2dFfvSkCdXdB9c4S26LOQO9/M/6Hpewsma0denU8HBl2
 NaLXjlueJZNUnoaw=
X-Received: by 2002:a63:5119:: with SMTP id f25mr2855209pgb.271.1627008571857; 
 Thu, 22 Jul 2021 19:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWLa2uXyhyrg2Zofx+U9EuhNgS/OV2JZ6YkKxJC5ma8rvAO8PBGDVJptnYDWXEkSZ9r+YrKw==
X-Received: by 2002:a63:5119:: with SMTP id f25mr2855195pgb.271.1627008571659; 
 Thu, 22 Jul 2021 19:49:31 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q21sm31876916pff.55.2021.07.22.19.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 19:49:31 -0700 (PDT)
Subject: Re: [PULL V3 for 6.2 0/6] COLO-Proxy patches for 2021-06-25
To: Zhang Chen <chen.zhang@intel.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210719090051.3824672-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9b791248-407d-8877-3f94-266d4f9e804f@redhat.com>
Date: Fri, 23 Jul 2021 10:49:25 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719090051.3824672-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/19 ÏÂÎç5:00, Zhang Chen Ð´µÀ:
> Hi Jason,
>
> Please help to queue COLO-proxy patches to net branch.
>
> Thanks
> Chen
>

Queued for 6.2

Thanks


> The following changes since commit fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6:
>
>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210718' into staging (2021-07-18 13:46:39 +0100)
>
> are available in the Git repository at:
>
>    https://github.com/zhangckid/qemu.git master-colo-21jun25-pull-request-v3
>
> for you to fetch changes up to 91176794e3a72c74b01e149638ac1a7e2dee73fc:
>
>    net/net.c: Add handler for passthrough filter command (2021-07-19 16:50:44 +0800)
>
>
> ----------------------------------------------------------------
>
> This series add passthrough support frame to object with network
> processing function. The first object is colo-compare.
>
> V3: Fix memory leak issue.
>
> V2: Optimize HMP code from Dave's comment.
>
> ----------------------------------------------------------------
> Zhang Chen (6):
>        qapi/net: Add IPFlowSpec and QMP command for filter passthrough
>        util/qemu-sockets.c: Add inet_parse_base to handle InetSocketAddressBase
>        hmp-commands: Add new HMP command for filter passthrough
>        net/colo-compare: Move data structure and define to .h file.
>        net/colo-compare: Add passthrough list to CompareState
>        net/net.c: Add handler for passthrough filter command
>
>   hmp-commands.hx        |  26 ++++++++
>   include/monitor/hmp.h  |   2 +
>   include/qemu/sockets.h |   1 +
>   monitor/hmp-cmds.c     |  63 +++++++++++++++++++
>   net/colo-compare.c     | 160 ++++++++++++++++--------------------------------
>   net/colo-compare.h     |  98 ++++++++++++++++++++++++++++++
>   net/net.c              | 205 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   qapi/net.json          |  78 ++++++++++++++++++++++++
>   util/qemu-sockets.c    |  14 +++++
>   9 files changed, 538 insertions(+), 109 deletions(-)
>


