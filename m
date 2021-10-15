Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14542E838
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 07:01:39 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFLe-0007Yq-Ti
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 01:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbEm1-0004Qk-8B
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbElz-0002UE-HZ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634271886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNhCwdAKUbCznlT06H6dwqEXij/fqHeurKPhn0fgjy8=;
 b=atxAucdRJFsGxIEOaOf7P5/9jo+s8bf8iW8G2WDpqzqfQyFOJk5OR9yacTCUuci3NC6gOh
 tLE6+PCXeNOhlXCUTcS/SfhF6o8KIAPthdftrPps2+vjnht4Bm9eHTPfLESeJE0xrypwpu
 0T4HVuOoQIK6EW2sxvZGHkBgRC0EN3k=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-gDyfGwZQNY-PcP9CMjhezw-1; Fri, 15 Oct 2021 00:24:44 -0400
X-MC-Unique: gDyfGwZQNY-PcP9CMjhezw-1
Received: by mail-pl1-f199.google.com with SMTP id
 ba4-20020a170902720400b0013a432f7556so3350184plb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZNhCwdAKUbCznlT06H6dwqEXij/fqHeurKPhn0fgjy8=;
 b=GyHHXDdB/gtXPfBnL82+qynuYdOOTtPTj3hoW/U6xGarkQVP+EaZ8RbxtMkagV2JA8
 STq5CePSnNJ4o09QEOcJ3xGzyv/Zbwjc433QSiR7NzYzxKQl2RQKVJTm5A8juIpz95cY
 G1d1ESsdQpyCNFvMqsFKp60e8+79nwvep+ZGvQIH3fqOsIE5vJdj0dtsah1TBd5x8FbC
 L+QnBoReNGU0p72B6LEW6SHtb0MOgZbrhh2i4uiGIWO+Emr7v2iMWBKyIzbkXzlEqzQh
 m+OKrx2LviVM/pJemk3FMQsyYHg2s43T7XZhRxMHyHhZkpUSGMfMbLD/zbiWmw9txR/D
 zYIg==
X-Gm-Message-State: AOAM531t8s2w3bByBVHwkwErqJv+Zpptgn1hRVG8F8bs4gK42JNrJaiw
 PgQioCRlS1QVydZgGR2OitGwCFtoJFSgHaurj+3rRhLRbuUtnH8F6Sd4BNPK+iuuhI4zq18IGaf
 fNkzpKNFPQluJlmQ=
X-Received: by 2002:a63:4f43:: with SMTP id p3mr7319674pgl.435.1634271883473; 
 Thu, 14 Oct 2021 21:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynfFcvB6LOz/U8+oOa9vKGdSD2EBIWNan+gH9EKZ7Mz49GXgsSDUYx6FbS4XvdmqfaarODzQ==
X-Received: by 2002:a63:4f43:: with SMTP id p3mr7319653pgl.435.1634271883231; 
 Thu, 14 Oct 2021 21:24:43 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q6sm3681240pgc.1.2021.10.14.21.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 21:24:42 -0700 (PDT)
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <69c4056c-4a9b-8480-80a0-2b78c9b90ffb@redhat.com>
 <CAJaqyWcQ314RN7-U1bYqCMXb+-nyhSi3ddqWv90ofFucMbveUw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8a68a144-ee7c-6e12-ebf0-e72aaa7d1e3c@redhat.com>
Date: Fri, 15 Oct 2021 12:24:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcQ314RN7-U1bYqCMXb+-nyhSi3ddqWv90ofFucMbveUw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/14 下午11:58, Eugenio Perez Martin 写道:
> On Wed, Oct 13, 2021 at 5:49 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/10/1 下午3:05, Eugenio Pérez 写道:
>>> This will make qemu aware of the device used buffers, allowing it to
>>> write the guest memory with its contents if needed.
>>>
>>> Since the use of vhost_virtqueue_start can unmasks and discard call
>>> events, vhost_virtqueue_start should be modified in one of these ways:
>>> * Split in two: One of them uses all logic to start a queue with no
>>>     side effects for the guest, and another one tha actually assumes that
>>>     the guest has just started the device. Vdpa should use just the
>>>     former.
>>> * Actually store and check if the guest notifier is masked, and do it
>>>     conditionally.
>>> * Left as it is, and duplicate all the logic in vhost-vdpa.
>>
>> Btw, the log looks not clear. I guess this patch goes for method 3. If
>> yes, we need explain it and why.
>>
>> Thanks
>>
> Sorry about being unclear. This commit log (and code) just exposes the
> problem and the solutions I came up with but does nothing to solve it.
> I'm actually going for method 3 for the next series but I'm open to
> doing it differently.


That's fine, but need to doc that method 3 is something that is done in 
the patch.

Thanks


>
>>> Signed-off-by: Eugenio Pérez<eperezma@redhat.com>


