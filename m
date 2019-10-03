Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEBECAF45
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 21:31:52 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iG6pL-0004By-68
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 15:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iG6o7-0003l8-Oh
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iG6o3-0003jg-2Y
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:30:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iG6nv-0003ez-R9
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:30:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F172309DEE3;
 Thu,  3 Oct 2019 19:30:21 +0000 (UTC)
Received: from [10.36.117.64] (ovpn-117-64.ams2.redhat.com [10.36.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AC805D6A9;
 Thu,  3 Oct 2019 19:30:18 +0000 (UTC)
Subject: Re: [PATCH v2] migration: Support gtree migration
To: quintela@redhat.com
References: <20191003145431.21154-1-eric.auger@redhat.com>
 <87muehhklm.fsf@trasno.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <98f28661-1595-69c1-2430-fefc2869b0a3@redhat.com>
Date: Thu, 3 Oct 2019 21:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87muehhklm.fsf@trasno.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 03 Oct 2019 19:30:21 +0000 (UTC)
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Juan,

On 10/3/19 6:14 PM, Juan Quintela wrote:
> Eric Auger <eric.auger@redhat.com> wrote:
>> Introduce support for GTree migration. A custom save/restore
>> is implemented. Each item is made of a key and a data. For that
>> reason, 2 VMSD objects are passed into the GTree VMStateField.
>>
>> When putting the items, the tree is traversed in sorted order by
>> g_tree_foreach.
>>
>> On the get() path, gtrees must be allocated using the proper
>> key compare, key destroy and value destroy. This can be done
>> externally of automatically. If done automatically, the set of
>              ^^
> 
> or.
> 
>> functions must be stored within the VMStateField in a new opaque
>> pointer.
> 
> I am not fully convinced that the automatic mode is needed.  Especially
> the ->data field.  I *fear* it being abused for other cases.
OK. I implemented your suggestion, ie. using preload and it does the
job. So I don't need that field anymore.
> 
>> Automatic allocation is needed for complex state save/restore.
>> For instance the virtio-iommu uses a gtree of domain and each
>> domain has a gtree of mappings.
> 
> There is a pre_load() function for the VMState that creates this.  it
> can be used to initualize the field value, no?  That way the data part
> is not needed.  I think this will make the code less complex, what do
> you think?
agreed
> 
>> Special care was taken about direct key (ie. when the key is not
>> a pointer to an object but is directly a value).
> 
> I am wondering if for this, it is better to add two VMSTATE (at least at
> the macro level).  SIMPLE_TREE, and TREE, or whataver oyou want to call
> it.  But I haven't fully looked into it.
I don't have a strong opinion here. At the moment I test the
key_vmsd->field and if it is NULL this means the key is a direct one.

Otherwise we could have 2 macros, a single info, but 2 different field
names. the name would allow to know the nature of the key.
> 
> The other general "consideration" that I have is that there is neither
> of:
> - marker between elements
so we have one
> - number of elements
you don't have it
> - total size/size of elements.
you just have the size of the key and the size of the value at the
moment. I could easily add the number of nodes.
> 
> That makes completelly impractical to "walk" the migration stream
> without understanding exactyl what is there.  (Now, to be fair, there
> are other parts of qemu that are like that.  PCI cames to mind.)
> 
>> Tests are added to test save/dump of structs containing gtrees
>> including the virtio-iommu domain/mappings scenario.
> 
> Really nice to have the tests.  Thanks.


> 
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> 
>> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
>> index 1fbfd099dd..4d9698eaab 100644
>> --- a/include/migration/vmstate.h
>> +++ b/include/migration/vmstate.h
>> @@ -171,6 +171,7 @@ struct VMStateField {
>>      int version_id;
>>      int struct_version_id;
>>      bool (*field_exists)(void *opaque, int version_id);
>> +    void *data;
>>  };
> 
> This is the bit that I don't really like :p
> 
>>  
>> +typedef struct GTreeInitData {
>> +    GCompareDataFunc key_compare_func;
>> +    gpointer key_compare_data;
>> +    GDestroyNotify key_destroy_func;
>> +    GDestroyNotify value_destroy_func;
>> +} GTreeInitData;
> 
> My understanding is that if you do this on the pre_load() function, you
> don't need this at all.
yep
> 
>> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
>> index bee658a1b2..06c4663de6 100644
>> --- a/migration/vmstate-types.c
>> +++ b/migration/vmstate-types.c
>> @@ -17,6 +17,7 @@
>>  #include "qemu/error-report.h"
>>  #include "qemu/queue.h"
>>  #include "trace.h"
>> +#include <glib.h>
>>  
>>  /* bool */
>>  
>> @@ -691,3 +692,135 @@ const VMStateInfo vmstate_info_qtailq = {
>>      .get  = get_qtailq,
>>      .put  = put_qtailq,
>>  };
>> +
>> +struct put_gtree_data {
>> +    QEMUFile *f;
>> +    const VMStateField *field;
>> +    QJSON *vmdesc;
>> +};
>> +
>> +static gboolean put_gtree_elem(gpointer key, gpointer value, gpointer data)
>> +{
>> +    struct put_gtree_data *capsule = (struct put_gtree_data *)data;
>> +    const VMStateField *field = capsule->field;
>> +    QEMUFile *f = capsule->f;
>> +    const VMStateDescription *key_vmsd = &field->vmsd[0];
>> +    const VMStateDescription *data_vmsd = &field->vmsd[1];
>> +
>> +    qemu_put_byte(f, true);
> 
> Ok.  there is a marker O:-)
yep
> 
>> +
>> +    /* put the key */
>> +    if (!key_vmsd->fields) {
>> +        qemu_put_be32(f, GPOINTER_TO_UINT(key));
>> +    } else {
>> +        if (vmstate_save_state(f, key_vmsd, key, capsule->vmdesc)) {
>> +            return true;
>> +        }
>> +    }
> 
> But it is magic to know if it is a simple or complex key.
key_vmsd->fields is used
this means you set

static const VMStateDescription vmstate_id_domain[2] = {
    {}, VMSTATE_DOMAIN /* direct key, value */
};


> 
> 
>> +    if (field->data) {
>> +        init_data = (GTreeInitData *)field->data;
>> +        tree = g_tree_new_full(init_data->key_compare_func,
>> +                               init_data->key_compare_data,
>> +                               init_data->key_destroy_func,
>> +                               init_data->value_destroy_func);
>> +        *pval = tree;
>> +    } else {
>> +        /* tree is externally allocated */
>> +        tree = *pval;
>> +    }
> 
> This can be simplified while we are at it.
yep, only the else block remains
> 
>> +    while (qemu_get_byte(f)) {
> 
> If we get out of sync, for any reason, we have no way to recover.  The
> only way to recover is that we don't get a "false" in this position.
adding the number of nodes should do the job
> 
> 
> Later, Juan.
> 

So I think I will respin with the following modifications:
- use preload
- introduce 2 different macros
- encode/decode & test the number of nodes

Thank you for the quick feedbacks!

Eric

