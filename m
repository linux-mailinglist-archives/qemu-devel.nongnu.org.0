Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5791D2A1E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:55:53 +0200 (CEST)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXyy-0002IU-TL
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iIXIZ-0005Ur-Vk
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iIXIX-00022M-8c
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:12:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iIXIW-00022C-W9
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:12:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B7D4C1DD3;
 Thu, 10 Oct 2019 12:11:59 +0000 (UTC)
Received: from [10.36.116.245] (ovpn-116-245.ams2.redhat.com [10.36.116.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA63760A9F;
 Thu, 10 Oct 2019 12:11:48 +0000 (UTC)
Subject: Re: [PATCH v3] migration: Support gtree migration
To: Peter Xu <peterx@redhat.com>
References: <20191004112025.28868-1-eric.auger@redhat.com>
 <20191009062852.GB1039@xz-x1>
 <27d37e80-31d8-006a-b2a8-c61c5129c7c4@redhat.com>
 <20191010113541.GG18958@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c6f0142b-f325-a12c-433d-b77387c0a8a9@redhat.com>
Date: Thu, 10 Oct 2019 14:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191010113541.GG18958@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 10 Oct 2019 12:11:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/10/19 1:35 PM, Peter Xu wrote:
> On Thu, Oct 10, 2019 at 09:57:01AM +0200, Auger Eric wrote:
>>>> +static gboolean put_gtree_elem(gpointer key, gpointer value, gpointer data)
>>>> +{
>>>> +    struct put_gtree_data *capsule = (struct put_gtree_data *)data;
>>>> +    QEMUFile *f = capsule->f;
>>>> +    int ret;
>>>> +
>>>> +    qemu_put_byte(f, true);
>>>> +
>>>> +    /* put the key */
>>>> +    if (!capsule->key_vmsd) {
>>>> +        qemu_put_be32(f, GPOINTER_TO_UINT(key)); /* direct key */
>>>
>>> This is special code path for direct key case.  Can we simply define
>>> VMSTATE_GTREE_DIRECT_KEY_V() somehow better so that it just uses the
>>> VMSTATE_UINT32_V() as the key vmsd?  Then iiuc vmstate_save_state()
>>> could work well with that too.
>> if the key_vmsd is a VMSTATE_UINT32_V then I understand
>> vmstate_save_state(f, capsule->key_vmsd, key, capsule->vmdesc)
>> expects key to be a pointer to a uint32. But in that case of direct key,
>> it is a uint32. I don't figure out how to use vmstate_save_state in your
>> proposal.
> 
> Ah I see the point.  And indeed I can't think of a better way now
> (e.g., maybe I will always try to use GTrees with malloc()ed keys to
> be simple when I want to migrate a gtree, but yeah that's not a reason
> to refuse this patch :).
> 
> Though we should be very careful on defining vmsds for GTrees in the
> future with the help of this patch, and we must have the type (either
> direct or not) to match the real usage of the tree otherwise QEMU can
> potentially unreference the constant as a pointer.
> 
>>
>>>
>>> Also, should we avoid using UINT in all cases?  But of course if we
>>> start to use VMSTATE_UINT32_V then we don't have this issue.
>> Depending on the clarification of above point, maybe I can rename
>> VMSTATE_GTREE_DIRECT_KEY_V into VMSTATE_GTREE_DIRECT_UINT_KEY_V
>>
>> direct keys seem to be more common for hash tables actually.
>> https://developer.gnome.org/glib/stable/glib-Hash-Tables.html#g-hash-table-new-full
>>
>> There are stand conversion macros to/from int, uint, size
>> https://developer.gnome.org/glib/stable/glib-Type-Conversion-Macros.html
> 
> Yeh it's fine to use direct keys.  Though my question was more about
> "unsigned int" - here when we put, we cast a pointer into unsigned
> int, which can be 2/4 bytes, IIUC.  I'm thinking whether at least we
> should use direct cast (e.g., (uint32_t)ptr) to replace
> GPOINTER_TO_UINT() to make sure it's 4 bytes.  Futher, maybe we should
> start with uint64_t here in the migration stream, otherwise we should
> probably drop the high 32 bits if we migrate a gtree whose key is 64
> bits long (and since we're working with migration we won't be able to
> change that in the future for compatibility reasons...).
> 
> Summary:
> 
> Maybe we can replace:
> 
>     qemu_put_be32(f, GPOINTER_TO_UINT(key)); /* direct key */
> 
> To:
> 
>     qemu_put_be64(f, (uint64_t)key); /* direct key */
> 
> And apply similar thing to get() side?

This was my first idea as well but I got stuck with a mingw compilation
issues if I remember correctly, trying to cast pointers to a wrong sized
uint. This got removed by using the GPOINTER_TO_UINT conversion functions.

Thanks

Eric
> 
> Thanks,
> 

