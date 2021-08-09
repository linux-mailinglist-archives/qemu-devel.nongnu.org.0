Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C86A3E4A26
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:43:00 +0200 (CEST)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8Md-0000SB-6j
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8Lo-0008DW-3l
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8Lk-00082W-U3
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628527323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Plbn2XKpIbTcaT2f4pwleWtFjU0N96U9TgH+MIR4A=;
 b=KTGjvyToU+Na3tyRJvq1+cgSaHJqA2Ub3SP7/4lfXPNcNDAITY/p6M2/1b8GmlqBoVKRFf
 xVWa32381K6T+0izceMNjD1k6DBYVWE5yZ/QqbqgoCTx1kdeeJmajSMrtXJCNX1mhoUZk/
 3CUmIcob9y88uW1pGelCSiqyDV1KZFI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-j2ovZQ-JMwytiprLbHO3JQ-1; Mon, 09 Aug 2021 12:42:01 -0400
X-MC-Unique: j2ovZQ-JMwytiprLbHO3JQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n6-20020a5d67c60000b0290153b1422916so5528829wrw.2
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K1Plbn2XKpIbTcaT2f4pwleWtFjU0N96U9TgH+MIR4A=;
 b=WsByG0Sw0V0X2oE3p6ga9rBAf2Zgl6o3Ss9qbRfKr2k6sRdlxjYjquq3uGbZvfWlvH
 H7s+lK7qRhmlUBB08uiFQMgn86aozO0Bpkv64KdV+VH+CYAxzwMz3Y7TA0PqJglmfA+i
 GR5QmPpWjcMHuxw2fG38ZTzP5MBmfgdFLxZJmWsbYRBczEko1kV6DEcG4OV8xObOkbNF
 zEq1jf1HHYBaPU1m3ClGqQk5Fm3SGTLuiELGK55sVy+DMFUiZ/JXZgr0eGJ93RgMHCEV
 Dh3TEADDXtcD5xYaD+jJOu4XQiSnjYiFeAGyxz3WrbXehrwiEdnODDVRKU0bOg+LEAwD
 DfmQ==
X-Gm-Message-State: AOAM531nEef5LXwjiiWW4xLW1ujNWAsDht5ubIWo2Qjyu4MrNkmeKx57
 wwQI5k4SklnMx7N8SOWdGYtDjmANJeetxi5Ou/RMo5fwydhXIVuQ4xJxTyqAYWFJI7DBYvoDxym
 bNXob2LV9aS/0QlQ=
X-Received: by 2002:a1c:80c4:: with SMTP id b187mr14369wmd.61.1628527320768;
 Mon, 09 Aug 2021 09:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvSsqI+9NKINGaLOwZ8sTOPr83Tpos94zEIlGAjUvsJ3hjhkxcZZJQAAGZEnEg1ZJz5qxQ6w==
X-Received: by 2002:a1c:80c4:: with SMTP id b187mr14353wmd.61.1628527320580;
 Mon, 09 Aug 2021 09:42:00 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 n29sm5919209wms.2.2021.08.09.09.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 09:42:00 -0700 (PDT)
Subject: Re: [PATCH v3 07/10] virtiofsd: Add lo_inode.fhandle
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-8-mreitz@redhat.com> <YRFH+vE30fwgGmu8@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <cbf910d8-47cd-f9b1-c9ac-6e0e2036c04a@redhat.com>
Date: Mon, 9 Aug 2021 18:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRFH+vE30fwgGmu8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.08.21 17:21, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:31PM +0200, Max Reitz wrote:
>> This new field is an alternative to lo_inode.fd: Either of the two must
>> be set.  In case an O_PATH FD is needed for some lo_inode, it is either
>> taken from lo_inode.fd, if valid, or a temporary FD is opened with
>> open_by_handle_at().
>>
>> Using a file handle instead of an FD has the advantage of keeping the
>> number of open file descriptors low.
>>
>> Because open_by_handle_at() requires a mount FD (i.e. a non-O_PATH FD
>> opened on the filesystem to which the file handle refers), but every
>> lo_fhandle only has a mount ID (as returned by name_to_handle_at()), we
>> keep a hash map of such FDs in mount_fds (mapping ID to FD).
>> get_file_handle(), which is added by a later patch, will ensure that
>> every mount ID for which we have generated a handle has a corresponding
>> entry in mount_fds.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c      | 116 ++++++++++++++++++++++----
>>   tools/virtiofsd/passthrough_seccomp.c |   1 +
>>   2 files changed, 102 insertions(+), 15 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 292b7f7e27..487448d666 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -88,8 +88,25 @@ struct lo_key {
>>       uint64_t mnt_id;
>>   };
>>   
>> +struct lo_fhandle {
>> +    union {
>> +        struct file_handle handle;
>> +        char padding[sizeof(struct file_handle) + MAX_HANDLE_SZ];
>> +    };
>> +    int mount_id;
>> +};
>> +
>> +/* Maps mount IDs to an FD that we can pass to open_by_handle_at() */
>> +static GHashTable *mount_fds;
>> +pthread_rwlock_t mount_fds_lock = PTHREAD_RWLOCK_INITIALIZER;
>> +
> How about if we move this hash table inside "struct lo_data". That seems to
> be one global data structure keeping all the info. Also it can be
> cleaned up during lo_destroy().

Yes, sounds good and right, will do.

Hanna


