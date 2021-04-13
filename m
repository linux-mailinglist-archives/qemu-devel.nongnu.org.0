Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E835DE09
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:49:54 +0200 (CEST)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHYH-0005uJ-Eq
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWHWQ-0004cO-64
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWHWK-0001y4-Ji
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618314467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C498OOED4CLcFMaIaqTqhLKEiaZDHSZNm4r57Ii6BYY=;
 b=h0RZK1me0m5MgnUn4tPOkez7mDjFLUxTOGFmHe0nJw142ZZmZHXkT/dPmd1lxEbwyE23rM
 NR8CiieERAPOWQFOhRYkRrgb6ylvfaeY8oP07Y+hkxRoFefAW1QfvQvywZ6FB1LIjgryhV
 7W8irSRrH4EK+L69saqnpWRFIx4Vc34=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-wrCVXdudOcKrNTfYaRna7w-1; Tue, 13 Apr 2021 07:47:46 -0400
X-MC-Unique: wrCVXdudOcKrNTfYaRna7w-1
Received: by mail-ej1-f71.google.com with SMTP id hr38so21334ejc.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 04:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C498OOED4CLcFMaIaqTqhLKEiaZDHSZNm4r57Ii6BYY=;
 b=NGXYnZJceqLyMG3FRQD0rh6XPrd4IOJpJx0cEroI19mmaXfNYTdYIQe3IQuCOIOcCE
 S9IP/JHNlRGEEkH+MRpwsipMaMdgBwth93qQ+e8osL4kbQfaiWnAPzMnob9jaOTTQIfd
 +yjn7TflclSKTxPa1gkuqeqhukR248dJ+Z7+XfHz7NM+bg0Ayt7182omyyGCUjSLSS0F
 qx9btvFjpg1jwv/UqGouDgQfDrRbZvfQc45HlpeACwUH95+gjC6X/A/MkIR1gPbEWT09
 6gr0FKHj/BYjdUE4xJcuLE6+Ca38FVpdJ94pGfrhSuoqmjWNxnzTffMOOJeUFpgEYsmM
 0Haw==
X-Gm-Message-State: AOAM5327z4l5poSvFlPMjmB5vUq4mCoi7L3bm9Sb3kxkjmDirE1DLma2
 ZrAcmHIEiFtZyBgOsqZYk7+s9RBOyrcKFBzkAKdSxy8HfZC6rPm+++bcK54/Vj2jZH4IENCycDH
 wWv9O2RMRp/oXyII=
X-Received: by 2002:a05:6402:382:: with SMTP id
 o2mr35012638edv.238.1618314464942; 
 Tue, 13 Apr 2021 04:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLKyk24AN9WoI3VO/bvie9tZmBcb1SLfYsnQ48a3Xb6f2dhZt8tO0jfdQ3DZWOJUVj5tXtUQ==
X-Received: by 2002:a05:6402:382:: with SMTP id
 o2mr35012620edv.238.1618314464685; 
 Tue, 13 Apr 2021 04:47:44 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id w13sm9600599edx.15.2021.04.13.04.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:47:44 -0700 (PDT)
Date: Tue, 13 Apr 2021 13:47:42 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
Message-ID: <20210413114742.i7bu2sc2w6ityjic@steredhat>
References: <20210412170255.231406-1-sgarzare@redhat.com>
 <22828e2d-2c8e-c753-31e5-7588f9064b10@redhat.com>
MIME-Version: 1.0
In-Reply-To: <22828e2d-2c8e-c753-31e5-7588f9064b10@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 12:59:36PM +0200, Philippe Mathieu-Daudé wrote:
>Is this fix aiming at 6.0 release?

The leak is minimal, but the fix is very simple.
So, I think it can go if someone has a pull request to send with other 
patches, but I'm not sure with which tree.

Thanks,
Stefano

>
>On 4/12/21 7:02 PM, Stefano Garzarella wrote:
>> get_relocated_path() allocates a GString object and returns the
>> character data (C string) to the caller without freeing the memory
>> allocated for that object as reported by valgrind:
>>
>>   24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
>>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>>      by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>      by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>      by 0x55C4827: g_string_sized_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>      by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>      by 0x906314: get_relocated_path (cutils.c:1036)
>>      by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
>>      by 0x6E1F77: qemu_init (vl.c:2687)
>>      by 0x3E3AF8: main (main.c:49)
>>
>> Let's use g_string_free(gstring, false) to free only the GString object
>> and transfer the ownership of the character data to the caller.
>>
>> Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  util/cutils.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index ee908486da..c9b91e7535 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>>          assert(G_IS_DIR_SEPARATOR(dir[-1]));
>>          g_string_append(result, dir - 1);
>>      }
>> -    return result->str;
>> +    return g_string_free(result, false);
>>  }
>>
>


