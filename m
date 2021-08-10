Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872493E5D45
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:18:32 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSaN-0004Go-Ia
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSZQ-0003aF-Mw
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSZO-0007hL-2N
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628605049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjL0EPosk+90x7MGfW4OAhTZd1BT+akl+LRRY/XuwYo=;
 b=MHioEyD1dXl25t2yQmc3lMnA0hqWQ1PIOgvk/bErtMrwIuz/ZlXFdtwSOc7spbGMN/aDTZ
 VRKWVXOxFoGYS5WXRpnwDmqZEZBMgqipCHYIoktEdp1oT1FxRQbKkzwEjNwCLMMzt9RKXl
 6OSiuJ55dBr4PyrsCeOks33AmJrVzfo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-yECNw5AOPq2P3BB7XabuVQ-1; Tue, 10 Aug 2021 10:17:28 -0400
X-MC-Unique: yECNw5AOPq2P3BB7XabuVQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d6d8c0000b029015488313d96so6477442wrs.15
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fjL0EPosk+90x7MGfW4OAhTZd1BT+akl+LRRY/XuwYo=;
 b=C2OwVc6TB8yFSDZM2E8G9QXAcA3Hg/VSeOPykBrisI75KVxaHpN6ruHKuAU1ER9QjI
 5/NfcJPzjtdGRIlFkHKmkcBRNPtloQZLkaV4Sb/o4A5frc4b33RqQPRByF9+i/g9uU0n
 cxNOMixW4oJoq8uw5yzggdopYkDi20PVNV8RScWDMJEbhM8R0yhzDBl86Yf84svO73eC
 s5ef0MWprrr0Md/eTs2XxEa/qdo7gx7XZrrj2t9uORzVIzLLlVaYleCnLGahSswGMUf2
 tKq7h6q8JUjUJPSMzadWbHOXukji0WSpi5Dqx1LTNdA4syz6g+FBjegrUFkzta2rIPOs
 Tr5Q==
X-Gm-Message-State: AOAM531G6ecfUOoHIJcU2+e5YBOTNd+I5Uxew9BjZ6rw8zOf63dHqUpf
 gDTlu/kRLdOg8z92p/El/I8H31Jk13Q89oQq+ULP5k/TXjAg5cdVFTIPCUYdDLUz81QuvLx0R73
 kEdweDmwnKQ/C1qQ=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr18222695wro.82.1628605046954; 
 Tue, 10 Aug 2021 07:17:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSlBQf77KGbWl2Pz5Oj/gk1blllMBsEdC/ueDaIxRHvkqCAxQKGuFlOcN4dttalx28Ba3KHg==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr18222665wro.82.1628605046780; 
 Tue, 10 Aug 2021 07:17:26 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 9sm21242685wmf.34.2021.08.10.07.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:17:26 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] virtiofsd: Add lazy lo_do_find()
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-11-mreitz@redhat.com> <YRF9Q+MSjrbeybd2@redhat.com>
 <dfebe39a-35d4-1e1c-c63f-2312586aa97d@redhat.com>
 <YRKJaKvnmYjp+4/j@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <93c22e7f-1aa3-1419-f702-4e02f326341f@redhat.com>
Date: Tue, 10 Aug 2021 16:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRKJaKvnmYjp+4/j@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.08.21 16:12, Vivek Goyal wrote:
> On Tue, Aug 10, 2021 at 10:38:32AM +0200, Hanna Reitz wrote:
>> On 09.08.21 21:08, Vivek Goyal wrote:
>>> On Fri, Jul 30, 2021 at 05:01:34PM +0200, Max Reitz wrote:
>>>> lo_find() right now takes two lookup keys for two maps, namely the file
>>>> handle for inodes_by_handle and the statx information for inodes_by_ids.
>>>> However, we only need the statx information if looking up the inode by
>>>> the file handle failed.
>>>>
>>>> There are two callers of lo_find(): The first one, lo_do_lookup(), has
>>>> both keys anyway, so passing them does not incur any additional cost.
>>>> The second one, lookup_name(), though, needs to explicitly invoke
>>>> name_to_handle_at() (through get_file_handle()) and statx() (through
>>>> do_statx()).  We need to try to get a file handle as the primary key, so
>>>> we cannot get rid of get_file_handle(), but we only need the statx
>>>> information if looking up an inode by handle failed; so we can defer
>>>> that until the lookup has indeed failed.
>>> So IIUC, this patch seems to be all about avoiding do_statx()
>>> call in lookup_name() if file handle could be successfully
>>> generated.
>>>
>>> So can't we just not modify lookup_name() to not call statx()
>>> if file handle could be generated. And also modfiy lo_find()
>>> to use st/mnt_id only if fhandle==NULL.
>>>
>>> That probably is much simpler change as compared to passing function
>>> pointers around.
>> Definitely, but I don’t know whether it’s correct.
> What problem do you see from correctness point of view.

Again assuming that file handle generation can randomly fail (this time 
assuming it failed the first time, and later may succeed), it’s possible 
we have an lo_inode that we want to look up that does not have a file 
handle, but for the lookup we were able to generate a file handle for 
it.  In such a case, we need to call statx() to get st_ino/st_dev/mnt_id.

>> Or, we can just drop this patch and say that we don’t need to over-optimize
>> C virtiofsd.
> Rust version is used by very few people, while C version is in production.
> So I will definitely optimize C version. Once rust version is widely
> available and available in product, then we can start paying less
> attention to C version, IMHO.

OK, it was just an offer.  I mean, I myself wrote this patch as an 
optimization after all. :)

Hanna


