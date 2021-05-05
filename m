Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C86373CAD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:50:59 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHvT-0005F3-Ab
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leHrC-0002eK-4O
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1leHrA-0006jk-Am
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620222387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COkwGc4RufrT9rhGuUpOhavltO2ZXAscxzuPuUgbGcQ=;
 b=Gs5jRl++Coov7uQgwC1EUU8QkR/eSDJ+LYHvNgFEv4gAqh9OSP2NbqJ23ERmJWB+h9VUY5
 WuA3KRFjeWCdl5jeP6qYRRN6Spg8KBgOzB1CdU/JUo2kVguTUK+QljxwPUndVYKIWOV/ui
 noiiSJZRn9HBZCavfcKeIQZ7nbcQRYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-0ST_0a9RPO6bGhrTPBnDLA-1; Wed, 05 May 2021 09:46:19 -0400
X-MC-Unique: 0ST_0a9RPO6bGhrTPBnDLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 769098049CA;
 Wed,  5 May 2021 13:46:18 +0000 (UTC)
Received: from [10.3.113.190] (ovpn-113-190.phx2.redhat.com [10.3.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE8A5D9D5;
 Wed,  5 May 2021 13:46:15 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210430162519.271607-1-philmd@redhat.com>
 <20210430162519.271607-5-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 4/4] block/vvfat: Avoid out of bounds write in
 create_long_filename()
Message-ID: <01208ec0-414d-dd94-015a-aaf513ecb0b5@redhat.com>
Date: Wed, 5 May 2021 08:46:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430162519.271607-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Johannes Schindelin <johannes.schindelin@gmx.de>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 11:25 AM, Philippe Mathieu-Daudé wrote:
> The direntry_t::name holds 11 bytes:
> 
>   typedef struct direntry_t {
>       uint8_t name[8 + 3];
>       ...

struct direntry_t is poorly laid out.  A quick google search finds:

https://www.ntfs.com/fat-filenames.htm

which shows that a long file name is indeed split over multiple fields
of struct direntry_t.  In addition to the direntry_t for the 8+3 short
name, there are additional direntry_t reserved for each 13 bytes of the
long name (well, 26 bytes of UTF-16, as those 13 bytes are expanded into
Unicode).

> 
> However create_long_filename() writes up to 31 bytes into it:
> 
>  421     for(i=0;i<26*number_of_entries;i++) {
>  422         int offset=(i%26);
>  423         if(offset<10) offset=1+offset;
>  424         else if(offset<22) offset=14+offset-10;
>  425         else offset=28+offset-22;
>  426         entry=array_get(&(s->directory),s->directory.next-1-(i/26));
>  427         if (i >= 2 * length + 2) {
>  428             entry->name[offset] = 0xff;
>  429         } else if (i % 2 == 0) {
>  430             entry->name[offset] = longname[i / 2] & 0xff;
>  431         } else {
>  432             entry->name[offset] = longname[i / 2] >> 8;
>  433         }
>  434     }

The code is probably correct for which bytes it is writing, but wrong
for calling it entry->name[offset]; what we probably want is:

typedef struct direntry_t {
  union {
    struct {
      uint8_t name[8 + 3];
      ...
      uint32_t size;
    };
    char raw[32];
  };
} QEMU_PACKED direntry_t;

where we then access through entry->raw[offset] instead of
entry->name[offset] (I know that anonymous union/structs are not
standard C, but I think that both gcc and clang support them, so that we
don't have to refactor the rest of the code to go through additional
names introduced by those modifications to direntry_t).

> 
> For example, if i=25, offset=28+25-22=31
> 
> Then in lines 428, 430 and 432 the entry->name[] array is written beside
> its 11 bytes, as reported by Clang sanitizer:
> 
>   block/vvfat.c:430:13: runtime error: index 14 out of bounds for type 'uint8_t [11]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior block/vvfat.c:430:13 in
>   block/vvfat.c:432:13: runtime error: index 15 out of bounds for type 'uint8_t [11]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior block/vvfat.c:432:13 in
>   block/vvfat.c:428:13: runtime error: index 18 out of bounds for type 'uint8_t [11]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior block/vvfat.c:428:13 in
> 
> As I have no idea about what this code does, simply skip the writes if
> out of range, since it is not worst than what we have currently (and
> my tests using vvfat work identically).
> 
> Fixes: de167e416fa ("Virtual VFAT support (Johannes Schindelin)")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

NACK.  This violates what FAT expects for long names.  Our code is not
pretty, but we should clean it up correctly rather than breaking it.

> ---
>  block/vvfat.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index c193a816646..c7162e77d68 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -423,6 +423,9 @@ static direntry_t *create_long_filename(BDRVVVFATState *s, const char *filename)
>          if(offset<10) offset=1+offset;
>          else if(offset<22) offset=14+offset-10;
>          else offset=28+offset-22;
> +        if (offset >= ARRAY_SIZE(entry->name)) {
> +            continue;
> +        }
>          entry=array_get(&(s->directory),s->directory.next-1-(i/26));
>          if (i >= 2 * length + 2) {
>              entry->name[offset] = 0xff;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


