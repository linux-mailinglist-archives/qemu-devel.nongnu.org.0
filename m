Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134D3E4433
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:52:05 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2t2-0005Lt-6z
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2lN-0002V6-D6
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2lJ-0007wO-T3
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628505843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSA+Un2sfAUaYhTHKjmQ8O+2yIhpv/ScoIIGxaecx44=;
 b=H/bcKExoa+fn3sZXTZC6Ns0/N4OPX41oxSrgHqHNy+pVkV0J0cIqUobatsMnDRTIEHHocH
 4spWrRptLeSAtmNNH/Z3/jcWYmWxGLwZOr17fdg0RddSfgj4PdM9rpJ8f/F2e65O3pa01t
 JRzHkkXijN1JCrvfT3sfepPJqEHdoKk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-CxoiAzZKP8W3UN84X0Q4Ng-1; Mon, 09 Aug 2021 06:44:02 -0400
X-MC-Unique: CxoiAzZKP8W3UN84X0Q4Ng-1
Received: by mail-wr1-f72.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so963441wru.19
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MSA+Un2sfAUaYhTHKjmQ8O+2yIhpv/ScoIIGxaecx44=;
 b=fCAUUPM9Hvj7u8+nygAl/sLgW35cpGMlN0ESM7Cjw9KlIr/I7qf1cUbw566yKRYpJV
 yd8Lyia/RXdJvgvdJc1Wf/cjBSVcmcucr5vYUhmwVNjvkBK7TGf6eQQqEsw9O8g16Dpy
 U8t60I5+lnvoUDZFDcMBOR6Kgr3LZrbLhiPtra0+gPd6fIzYyX4il+se96VBtBzj5uzN
 XigBMPLEyYlAxBe7XR6mCRiED1N47/L5BbvGALeWHp/2MUlXoLhNYYxyKuoepEgohWPZ
 ZE3u0fpm0JPcrwDY2Q5P4ZHI1L1kSdmWR2g1LK9oy9n1giKnAidjR8fzUVAmRFSqVgU7
 8upQ==
X-Gm-Message-State: AOAM530xH37oSyKGS3Uz+ojnmPH/aHDUbOdzGDIkrd1nCdFTdvvDWV9v
 KKAmmDj9//HR/b9ktGBvgDMXWR8aFTOYSB4vb6c86kSLCYUtrbsXPkDZiRho2Ynp/2FKvWfEfn2
 00kE5TMBHQG7nA3Q=
X-Received: by 2002:adf:eac7:: with SMTP id o7mr24073046wrn.52.1628505841421; 
 Mon, 09 Aug 2021 03:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmhbYo0CinZKFIgHoYQLZ2gPjSninIcBgtvNsiedBOiup+9chxg8uqRcDytESadHBvjqAgGg==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr24073019wrn.52.1628505841131; 
 Mon, 09 Aug 2021 03:44:01 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g35sm4461539wmp.9.2021.08.09.03.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:44:00 -0700 (PDT)
Subject: Re: [PATCH v3 02/10] virtiofsd: Add TempFd structure
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-3-mreitz@redhat.com> <YQ1KCya+NHd96kvv@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a9b09a33-b8b6-2e9f-42e9-edefb2459653@redhat.com>
Date: Mon, 9 Aug 2021 12:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQ1KCya+NHd96kvv@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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

On 06.08.21 16:41, Vivek Goyal wrote:
> On Fri, Jul 30, 2021 at 05:01:26PM +0200, Max Reitz wrote:
>> We are planning to add file handles to lo_inode objects as an
>> alternative to lo_inode.fd.  That means that everywhere where we
>> currently reference lo_inode.fd, we will have to open a temporary file
>> descriptor that needs to be closed after use.
>>
>> So instead of directly accessing lo_inode.fd, there will be a helper
>> function (lo_inode_fd()) that either returns lo_inode.fd, or opens a new
>> file descriptor with open_by_handle_at().  It encapsulates this result
>> in a TempFd structure to let the caller know whether the FD needs to be
>> closed after use (opened from the handle) or not (copied from
>> lo_inode.fd).
> I am wondering why this notion of "owned". Why not have this requirement
> of always closing "fd". If we copied it from lo_inode.fd, then we will
> need to dup() it. Otherwise we opened it from file handle and we will
> need to close it anyway.
>
> I guess you are trying to avoid having to call dup() and that's why
> this notion of "owned" fd.

Yes, I don’t want to dup() it.  One reason is that I’d rather just not.  
It’s something that we can avoid, and dup-ing every time wouldn’t make 
the code that much simpler (I think, without having tried).

One other is because this affects the current behavior (with O_PATH 
FDs), which I don’t want to alter.

Well, and finally, as a pragmatic reason, virtiofsd-rs uses the same 
structure and I don’t really want C virtiofsd and virtiofsd-rs to differ 
too much.

>> By using g_auto(TempFd) to store this result, callers will not even have
>> to care about closing a temporary FD after use.  It will be done
>> automatically once the object goes out of scope.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 49 ++++++++++++++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 1f27eeabc5..fb5e073e6a 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -178,6 +178,28 @@ struct lo_data {
>>       int user_posix_acl, posix_acl;
>>   };
>>   
>> +/**
>> + * Represents a file descriptor that may either be owned by this
>> + * TempFd, or only referenced (i.e. the ownership belongs to some
>> + * other object, and the value has just been copied into this TempFd).
>> + *
>> + * The purpose of this encapsulation is to be used as g_auto(TempFd)
>> + * to automatically clean up owned file descriptors when this object
>> + * goes out of scope.
>> + *
>> + * Use temp_fd_steal() to get an owned file descriptor that will not
>> + * be closed when the TempFd goes out of scope.
>> + */
>> +typedef struct {
>> +    int fd;
>> +    bool owned; /* fd owned by this object? */
>> +} TempFd;
>> +
>> +#define TEMP_FD_INIT ((TempFd) { .fd = -1, .owned = false })
>> +
>> +static void temp_fd_clear(TempFd *temp_fd);
>> +G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(TempFd, temp_fd_clear);
>> +
>>   static const struct fuse_opt lo_opts[] = {
>>       { "sandbox=namespace",
>>         offsetof(struct lo_data, sandbox),
>> @@ -255,6 +277,33 @@ static struct lo_data *lo_data(fuse_req_t req)
>>       return (struct lo_data *)fuse_req_userdata(req);
>>   }
>>   
>> +/**
>> + * Clean-up function for TempFds
>> + */
>> +static void temp_fd_clear(TempFd *temp_fd)
>> +{
>> +    if (temp_fd->owned) {
>> +        close(temp_fd->fd);
>> +        *temp_fd = TEMP_FD_INIT;
>> +    }
>> +}
>> +
>> +/**
>> + * Return an owned fd from *temp_fd that will not be closed when
>> + * *temp_fd goes out of scope.
>> + *
>> + * (TODO: Remove __attribute__ once this is used.)
>> + */
>> +static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
>> +{
>> +    if (temp_fd->owned) {
>> +        temp_fd->owned = false;
>> +        return temp_fd->fd;
>> +    } else {
>> +        return dup(temp_fd->fd);
>> +    }
>> +}
> This also will be simpler if we always called dup() and every caller
> will close() fd.
>
> I think only downside is having to call dup()/close(). Not sure if this
> is an expensive operation or not.
>
> Vivek
>


