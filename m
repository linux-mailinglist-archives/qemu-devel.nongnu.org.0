Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336443D5BC1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:35:38 +0200 (CEST)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81hh-0003c1-5R
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m81g5-0001ms-HL
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m81g2-0006s0-Mu
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627310033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cevgWW5wlUyUrxUf3oBlyYPxTkxx5LYdgYOmJcIYVz8=;
 b=LK4YWb+dhqxxBkV1iPb5k8+EGJEh8bcyajARBgQvskWPoAGf2ZR+deWKOhPic6qmylFXmK
 AVHZ3tbSP1pRgU8ac33g9qRG0X0JGNu+QLrvR0/7tD9ghnxv+2JicRahvB6Aj+JFpNI4AR
 B9KRyWqxn0SRysJShdrXQmKRoiwiWlo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-ztmGapEkOwWcMrF2pssaeg-1; Mon, 26 Jul 2021 10:33:52 -0400
X-MC-Unique: ztmGapEkOwWcMrF2pssaeg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso4799761wrw.11
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cevgWW5wlUyUrxUf3oBlyYPxTkxx5LYdgYOmJcIYVz8=;
 b=mp+naFWixvUE6KorbCW7H5RLCLiWvGAr9oCIdCirJseJnhYqlJjAimfysf5RvIi3au
 tpuAy5vkkO7GAjCMIHsKD36q0RxDSKAIvSODceAjbYtf5FhZYPlH/5uJjy7NP39LtZtT
 a4Dv5rpiekHqDSfHowtxJ4UY3b8yF5cnqE5Ax4BiHw8k4Fpb/AV8yOrgpNp+wgLqBcI2
 9nZbSb1A2JUEFZGdJTJzx2LFLBMR86hsY3cW75SktTZjigXjHSujYPup5RKFtTq9pcxb
 Py5SkpeF/Qk611/9GvD1fL5VTS7Oy06sDR0o1VzfogPkU1RbXr01G3WLFx+Z5iY4zULW
 BvKw==
X-Gm-Message-State: AOAM533Ig1/yC6V4x7cjK2MmeiWgkXYvnWodxZKyMvLaCAs4cd6yzlN2
 8H74JEuOaNYA/rqmQflp0JZl/nv4kBET8YbWDmDcEoQpVCUF+PCqBl7WbIfSg8yyQzqrYnTQG4K
 R6qWrlYMD3IMzjzw=
X-Received: by 2002:a5d:64e8:: with SMTP id g8mr20482003wri.140.1627310030130; 
 Mon, 26 Jul 2021 07:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUEMgbodLYzugGOEx/I68o2LstMY+tSy/QUAnMbvdz+YUml+EtEsAH237CteocAC4PRZxjDw==
X-Received: by 2002:a5d:64e8:: with SMTP id g8mr20481975wri.140.1627310029880; 
 Mon, 26 Jul 2021 07:33:49 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g3sm42745585wru.95.2021.07.26.07.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:33:49 -0700 (PDT)
Date: Mon, 26 Jul 2021 15:33:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1 04/10] docs/devel/migration.rst: Format literals
 correctly
Message-ID: <YP7HyzYJa+IT57ff@work-vm>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
 <20210726142338.31872-5-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210726142338.31872-5-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> In rST markup, single backticks `like this` represent "interpreted
> text", which can be handled as a bunch of different things if tagged
> with a specific "role":
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
> (the most common one for us is "reference to a URL, which gets
> hyperlinked").
> 
> The default "role" if none is specified is "title_reference",
> intended for references to book or article titles, and it renders
> into the HTML as <cite>...</cite> (usually comes out as italics).
> 
> To format a literal (generally rendered as fixed-width font),
> double-backticks are required.
> 
> Mostly migration.rst gets this right, but some places incorrectly use
> single backticks where double backticks were intended; correct them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/devel/migration.rst | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 19c3d4f3eac..24012534827 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -53,7 +53,7 @@ savevm/loadvm functionality.
>  Debugging
>  =========
>  
> -The migration stream can be analyzed thanks to `scripts/analyze-migration.py`.
> +The migration stream can be analyzed thanks to ``scripts/analyze-migration.py``.
>  
>  Example usage:
>  
> @@ -75,8 +75,8 @@ Common infrastructure
>  =====================
>  
>  The files, sockets or fd's that carry the migration stream are abstracted by
> -the  ``QEMUFile`` type (see `migration/qemu-file.h`).  In most cases this
> -is connected to a subtype of ``QIOChannel`` (see `io/`).
> +the  ``QEMUFile`` type (see ``migration/qemu-file.h``).  In most cases this
> +is connected to a subtype of ``QIOChannel`` (see ``io/``).
>  
>  
>  Saving the state of one device
> @@ -166,14 +166,14 @@ An example (from hw/input/pckbd.c)
>    };
>  
>  We are declaring the state with name "pckbd".
> -The `version_id` is 3, and the fields are 4 uint8_t in a KBDState structure.
> +The ``version_id`` is 3, and the fields are 4 uint8_t in a KBDState structure.
>  We registered this with:
>  
>  .. code:: c
>  
>      vmstate_register(NULL, 0, &vmstate_kbd, s);
>  
> -For devices that are `qdev` based, we can register the device in the class
> +For devices that are ``qdev`` based, we can register the device in the class
>  init function:
>  
>  .. code:: c
> @@ -210,9 +210,9 @@ another to load the state back.
>                             SaveVMHandlers *ops,
>                             void *opaque);
>  
> -Two functions in the ``ops`` structure are the `save_state`
> -and `load_state` functions.  Notice that `load_state` receives a version_id
> -parameter to know what state format is receiving.  `save_state` doesn't
> +Two functions in the ``ops`` structure are the ``save_state``
> +and ``load_state`` functions.  Notice that ``load_state`` receives a version_id
> +parameter to know what state format is receiving.  ``save_state`` doesn't
>  have a version_id parameter because it always uses the latest version.
>  
>  Note that because the VMState macros still save the data in a raw
> @@ -385,18 +385,18 @@ migration of a device, and using them breaks backward-migration
>  compatibility; in general most changes can be made by adding Subsections
>  (see above) or _TEST macros (see above) which won't break compatibility.
>  
> -Each version is associated with a series of fields saved.  The `save_state` always saves
> -the state as the newer version.  But `load_state` sometimes is able to
> +Each version is associated with a series of fields saved.  The ``save_state`` always saves
> +the state as the newer version.  But ``load_state`` sometimes is able to
>  load state from an older version.
>  
>  You can see that there are several version fields:
>  
> -- `version_id`: the maximum version_id supported by VMState for that device.
> -- `minimum_version_id`: the minimum version_id that VMState is able to understand
> +- ``version_id``: the maximum version_id supported by VMState for that device.
> +- ``minimum_version_id``: the minimum version_id that VMState is able to understand
>    for that device.
> -- `minimum_version_id_old`: For devices that were not able to port to vmstate, we can
> +- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
>    assign a function that knows how to read this old state. This field is
> -  ignored if there is no `load_state_old` handler.
> +  ignored if there is no ``load_state_old`` handler.
>  
>  VMState is able to read versions from minimum_version_id to
>  version_id.  And the function ``load_state_old()`` (if present) is able to
> @@ -454,7 +454,7 @@ data and then transferred to the main structure.
>  
>  If you use memory API functions that update memory layout outside
>  initialization (i.e., in response to a guest action), this is a strong
> -indication that you need to call these functions in a `post_load` callback.
> +indication that you need to call these functions in a ``post_load`` callback.
>  Examples of such memory API functions are:
>  
>    - memory_region_add_subregion()
> @@ -823,12 +823,12 @@ Postcopy migration with shared memory needs explicit support from the other
>  processes that share memory and from QEMU. There are restrictions on the type of
>  memory that userfault can support shared.
>  
> -The Linux kernel userfault support works on `/dev/shm` memory and on `hugetlbfs`
> -(although the kernel doesn't provide an equivalent to `madvise(MADV_DONTNEED)`
> +The Linux kernel userfault support works on ``/dev/shm`` memory and on ``hugetlbfs``
> +(although the kernel doesn't provide an equivalent to ``madvise(MADV_DONTNEED)``
>  for hugetlbfs which may be a problem in some configurations).
>  
>  The vhost-user code in QEMU supports clients that have Postcopy support,
> -and the `vhost-user-bridge` (in `tests/`) and the DPDK package have changes
> +and the ``vhost-user-bridge`` (in ``tests/``) and the DPDK package have changes
>  to support postcopy.
>  
>  The client needs to open a userfaultfd and register the areas
> -- 
> 2.20.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


