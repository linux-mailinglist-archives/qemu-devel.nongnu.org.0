Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D776029B6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:54:55 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okkFK-0001j7-H3
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1okk7X-0005eC-OC
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:46:51 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:48374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1okk7W-0008I3-0Z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:46:51 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55D941FA17;
 Tue, 18 Oct 2022 10:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666090006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOV8z+lxk6tW3SNPElry+h/m6SU0ZxQUGmEPQJbcRU4=;
 b=IYvQqNUxbtkJ4+oiDH/A3dS2WGyySgji1PP/p58oFH5pWawbAj0tWAgbofyrsAhiY8mEZ2
 2fg+RQX5dmLt7ITFAl0XldTrhVoZYAlnLHJvtYQHJMsj1XvvxyOWbCMh47gmrI7YOPnmq0
 nu8miw1k/w0X2wGqoqXxruLuOKaiolc=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00125139D2;
 Tue, 18 Oct 2022 10:46:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4zruOBWETmMPOAAAMHmgww
 (envelope-from <nborisov@suse.com>); Tue, 18 Oct 2022 10:46:45 +0000
Message-ID: <c89d961a-569f-e836-1513-2c20d732102f@suse.com>
Date: Tue, 18 Oct 2022 13:46:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 05/11] io: Add support for seekable channels
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-6-nborisov@suse.com> <Y058a4c549dx50d+@redhat.com>
From: Nikolay Borisov <nborisov@suse.com>
In-Reply-To: <Y058a4c549dx50d+@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=nborisov@suse.com; helo=smtp-out2.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 18.10.22 г. 13:14 ч., Daniel P. Berrangé wrote:
> On Mon, Oct 10, 2022 at 04:34:02PM +0300, Nikolay Borisov wrote:
>>   Add a bunch of auxiliarry methods and a feature flag to work with
>>   SEEKABLE channels. Currently the only channel considered seekable is
>>   QIOChannelFile. Also add a bunch of helper functions to QEMUFile that
>>   can make use of this channel feature. All of this is in prepration for
>>   supporting 'fixed-ram' migration stream feature.
> 
> QIOChannelBuffer/Null are also seekable.

Right, however I think for seek we also want to rely on the feature of 
filesystem that when you seek beyond EOF you won't actually allocate/use 
up the space from (eof, CUR_SEEK), with ChannelBuffer we'd have to 
actually allocate the space or add this support on top.

> 
>>
>> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
>> ---
>>   include/io/channel.h                |  1 +
>>   include/migration/qemu-file-types.h |  2 +
>>   io/channel-file.c                   |  5 +++
>>   migration/qemu-file.c               | 59 +++++++++++++++++++++++++++++
>>   migration/qemu-file.h               |  3 ++
>>   5 files changed, 70 insertions(+)
> 
> Can you separate the migration/ tree bits into a second patch
> that follows the io/ bits.
> 
>>
>> diff --git a/include/io/channel.h b/include/io/channel.h
>> index c680ee748021..4fc37c78e68c 100644
>> --- a/include/io/channel.h
>> +++ b/include/io/channel.h
>> @@ -41,6 +41,7 @@ enum QIOChannelFeature {
>>       QIO_CHANNEL_FEATURE_SHUTDOWN,
>>       QIO_CHANNEL_FEATURE_LISTEN,
>>       QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
>> +    QIO_CHANNEL_FEATURE_SEEKABLE,
>>   };
>>   
>>   
>> diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu-file-types.h
>> index 2867e3da84ab..eb0325ee8687 100644
>> --- a/include/migration/qemu-file-types.h
>> +++ b/include/migration/qemu-file-types.h
>> @@ -50,6 +50,8 @@ unsigned int qemu_get_be16(QEMUFile *f);
>>   unsigned int qemu_get_be32(QEMUFile *f);
>>   uint64_t qemu_get_be64(QEMUFile *f);
>>   
>> +bool qemu_file_is_seekable(QEMUFile *f);
>> +
>>   static inline void qemu_put_be64s(QEMUFile *f, const uint64_t *pv)
>>   {
>>       qemu_put_be64(f, *pv);
>> diff --git a/io/channel-file.c b/io/channel-file.c
>> index da17d0a11ba7..d84a6737f2f7 100644
>> --- a/io/channel-file.c
>> +++ b/io/channel-file.c
>> @@ -35,6 +35,7 @@ qio_channel_file_new_fd(int fd)
>>   
>>       ioc->fd = fd;
>>   
>> +    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
>>       trace_qio_channel_file_new_fd(ioc, fd);
>>   
>>       return ioc;
>> @@ -59,6 +60,10 @@ qio_channel_file_new_path(const char *path,
>>           return NULL;
>>       }
>>   
>> +    if (lseek(ioc->fd, 0, SEEK_CUR) != (off_t)-1) {
>> +        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
>> +    }
>> +
>>       trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);
> 
> Wondering why you do the lseek() sanitytest for only one of the
> two constructors ? Shouldn't we do it for both ?

Good point, AFAIR my train of thought was something along the lines of 
"what if the path being passed actually lies on a remote fs, we 
definitely need to test for this support", however now that I think 
about it a bit more - nothing prevents for the passed in fd to also be 
lying on a remote fs, so good point. Will fix this in next iteration.

> 
> 
> 
> 
> With regards,
> Daniel

