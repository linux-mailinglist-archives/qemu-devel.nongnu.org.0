Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3655EC481
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:32:10 +0200 (CEST)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAgz-0003aD-9K
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1od99X-0002LC-UO
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1od99T-0006V1-IX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664279601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8fjv9vX2zNNya3vMsJ0rcfaX4B8gMhJ6LrIs3oZI7Cs=;
 b=eJ1TxPqH0dZ+p/B5iEjrAr1D5RpO4W19O3jf0vJ4Uw3rJgefw4ntqXwcDFe3Re/WP/uY19
 AbPhTQOMt6ax/fNWZuyTk5Z5dCMeLo1WaYCNif8cL7fp5/UiX8hGxICJTU2+/+g0PQHG+h
 vHLlmMFoxuLbkCT4UIbVO/Ed87eugxM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-NxHA66fcOX-WIkEd8tFV_Q-1; Tue, 27 Sep 2022 07:53:18 -0400
X-MC-Unique: NxHA66fcOX-WIkEd8tFV_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F3033C0D183;
 Tue, 27 Sep 2022 11:53:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 775AA492B13;
 Tue, 27 Sep 2022 11:53:16 +0000 (UTC)
Date: Tue, 27 Sep 2022 13:53:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 3/5] module: add Error arguments to module_load and
 module_load_qom
Message-ID: <YzLkK5L8b52YGlyo@redhat.com>
References: <20220923232104.28420-1-cfontana@suse.de>
 <20220923232104.28420-4-cfontana@suse.de>
 <YzGBOwBQucv1F2NL@redhat.com>
 <3dc4a54e-7d04-36db-0931-2fb8d068b5f2@suse.de>
 <87a66lmev9.fsf@pond.sub.org>
 <6abb6453-1756-92b9-2afd-cc3ee69870d1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6abb6453-1756-92b9-2afd-cc3ee69870d1@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Am 27.09.2022 um 11:13 hat Claudio Fontana geschrieben:
> On 9/27/22 09:54, Markus Armbruster wrote:
> > Claudio Fontana <cfontana@suse.de> writes:
> > 
> >> On 9/26/22 12:38, Kevin Wolf wrote:
> >>> Am 24.09.2022 um 01:21 hat Claudio Fontana geschrieben:
> >>>> improve error handling during module load, by changing:
> >>>>
> >>>> bool module_load(const char *prefix, const char *lib_name);
> >>>> void module_load_qom(const char *type);
> >>>>
> >>>> to:
> >>>>
> >>>> int module_load(const char *prefix, const char *name, Error **errp);
> >>>> int module_load_qom(const char *type, Error **errp);
> >>>>
> >>>> where the return value is:
> >>>>
> >>>>  -1 on module load error, and errp is set with the error
> >>>>   0 on module or one of its dependencies are not installed
> >>>>   1 on module load success
> >>>>   2 on module load success (module already loaded or built-in)
> >>>>
> >>>> module_load_qom_one has been introduced in:
> >>>>
> >>>> commit 28457744c345 ("module: qom module support"), which built on top of
> >>>> module_load_one, but discarded the bool return value. Restore it.
> >>>>
> >>>> Adapt all callers to emit errors, or ignore them, or fail hard,
> >>>> as appropriate in each context.
> >>>>
> >>>> Some memory leaks also fixed as part of the module_load changes.
> >>>>
> >>>> audio: when attempting to load an audio module, report module load errors.
> >>>> block: when attempting to load a block module, report module load errors.
> >>>> console: when attempting to load a display module, report module load errors.
> >>>>
> >>>> qdev: when creating a new qdev Device object (DeviceState), report load errors.
> >>>>       If a module cannot be loaded to create that device, now abort execution.
> >>>>
> >>>> qom/object.c: when initializing a QOM object, or looking up class_by_name,
> >>>>               report module load errors.
> >>>>
> >>>> qtest: when processing the "module_load" qtest command, report errors
> >>>>        in the load of the module.
> >>>>
> >>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>
> >>>> diff --git a/block/dmg.c b/block/dmg.c
> >>>> index 007b8d9996..a422cf8d5b 100644
> >>>> --- a/block/dmg.c
> >>>> +++ b/block/dmg.c
> >>>> @@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
> >>>>      uint64_t plist_xml_offset, plist_xml_length;
> >>>>      int64_t offset;
> >>>>      int ret;
> >>>> +    Error *local_err = NULL;
> >>>>  
> >>>>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
> >>>>      if (ret < 0) {
> >>>> @@ -446,8 +447,15 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
> >>>>          return -EINVAL;
> >>>>      }
> >>>>  
> >>>> -    block_module_load("dmg-bz2");
> >>>> -    block_module_load("dmg-lzfse");
> >>>> +    if (block_module_load("dmg-bz2", &local_err) < 0) {
> >>>> +        error_report_err(local_err);
> >>>> +        return -EINVAL;
> >>>> +    }
> >>>> +    local_err = NULL;
> >>>> +    if (block_module_load("dmg-lzfse", &local_err) < 0) {
> >>>> +        error_report_err(local_err);
> >>>> +        return -EINVAL;
> >>
> >> I am concerned about the resources allocation here though,
> >> is returning EINVAL here right, vs using "goto fail"?
> >>
> >> I matched the behavior of the preceding call:
> >>
> >>     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
> >>                                BDRV_CHILD_IMAGE, false, errp);
> >>     if (!bs->file) {
> >>         return -EINVAL;
> >>     }
> >>
> >> But afterwards the code goes:
> >> .
> >>     /* locate the UDIF trailer */
> >>     offset = dmg_find_koly_offset(bs->file, errp);
> >>     if (offset < 0) {
> >>         ret = offset;
> >>         goto fail;
> >>     }
> >>
> >> Should the resources be freed or not in your view?
> > 
> > Functions should generally fail cleanly, and that means undoing side
> > effects such as allocations.
> 
> This is pretty obvious.
> 
> Note that this function does not perform the allocations,
> bdrv_open is called with existing allocated resources,
> and then frees those resources only in specific code paths.

These aren't allocated, the caller just allocates the BDRVDMGState and
initialises it with zeros. In other words, at this point, the free
functions don't do anything yet and you may or may not call them, it
doesn't matter.

We have an explicit line like this after the module loading:

    s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;

It's completely unnecessary because the BDRVDMGState is already
initialised like this, but if you think of this as the point where these
fields come to life, using a direct return before it and 'goto fail'
afterwards makes a little bit of sense at least.

As far as I can tell, only dmg_read_resource_fork() or
dmg_read_plist_xml() actually allocate some memeory that needs to be
undone, so some of the existing 'goto fail' instances could be direct
returns. But they're not wrong either, so no need to change them.

Kevin


