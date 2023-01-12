Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C9667C24
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:59:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0uL-00046p-JB; Thu, 12 Jan 2023 11:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG0uI-00046M-DZ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:58:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG0uG-0003AO-53
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673542700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dy+S6xiNK4sYktiNPIHBCJhCcvUbccBL7ycdp3nzkC0=;
 b=MRVsd+G1PUGwMrzCOz34284QoElMFEIPgNrRCjITlQnfQb4EqyEoaLXFQEkQUcG7xk3QYK
 6kJIZstBCEtk+IJCp45HS86xl3MVdk7mufD5HILPy/owYCyTPWb0NTzVomwiFkRVGMdgKy
 HRS50E/f1vdUfW2Cr6vpCGT8H8pGkjU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-JFfU1M1dNXauRtnbyVKn_g-1; Thu, 12 Jan 2023 11:58:19 -0500
X-MC-Unique: JFfU1M1dNXauRtnbyVKn_g-1
Received: by mail-wr1-f70.google.com with SMTP id
 e29-20020adf9bdd000000b002bb0d0ea681so3624225wrc.20
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dy+S6xiNK4sYktiNPIHBCJhCcvUbccBL7ycdp3nzkC0=;
 b=BxnH7rQO2sK+XMFVzc26E9OG+vFYFE4tYjE54qLbq7gFbBUOoAASROenKTqW/sZO4e
 7C81wZmTakJrIY1k55Ffxx+OMsgzDDfl5dDCc21ybVEF5SyBjnGb0oZe2ibrPrGmlaRY
 7/f8dxeBiT9nEig9FvXd3ac2NL9SziFIZEKwzCqYIfJL7NySXZO6ca/oB1NRPu1ElHxF
 lx0KWYECuFyhgfiCWg5xDjtQszov3l2jDuwJCgKJK1kmk9Fr3DxS8ncL/2thrSarUyRW
 HCgS+PoPVhBfpfaTxlzTPWGTinyOkGJCxui4suZkTJAWs6j/xl9w1yniiB3HxN5oeqYh
 ltcg==
X-Gm-Message-State: AFqh2krheCLZhZl8R70pQtRQpbFw3HIqVP0Ur6eJjFN6Cn9X1SFsBrRc
 v5Zy64um5/3x+BSOfNxBBsFOAGW5RMTD7YO9liIcH4kkbhfTU1erTunbnj+h1Efbnq6U5V5jKqH
 RQ4quWljacwJONac=
X-Received: by 2002:adf:fa84:0:b0:28b:ca44:6458 with SMTP id
 h4-20020adffa84000000b0028bca446458mr32875979wrr.2.1673542698269; 
 Thu, 12 Jan 2023 08:58:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuLyXytuGVHG6OnL1a+XrcPyh2dnXYxJqCNCZOF6YTvdSsT0oQn9QT/7FubGpkcraAdw43fcA==
X-Received: by 2002:adf:fa84:0:b0:28b:ca44:6458 with SMTP id
 h4-20020adffa84000000b0028bca446458mr32875965wrr.2.1673542698037; 
 Thu, 12 Jan 2023 08:58:18 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 cl10-20020a5d5f0a000000b002423620d356sm17014718wrb.35.2023.01.12.08.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 08:58:17 -0800 (PST)
Date: Thu, 12 Jan 2023 16:58:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/8] migration/savevm: Move more savevm handling into
 vmstate_save()
Message-ID: <Y8A8J78zL3hW9z34@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-2-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* David Hildenbrand (david@redhat.com) wrote:
> Let's move more code into vmstate_save(), reducing code duplication and
> preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
> have to move vmstate_save() to make the compiler happy.
> 
> We'll now also trace from qemu_save_device_state().

Mostly OK, but..

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/savevm.c | 79 ++++++++++++++++++++++------------------------

Doesn't this also need to upate trace-events?

Dave

>  1 file changed, 37 insertions(+), 42 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a0cdb714f7..d8830297e4 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -897,17 +897,6 @@ static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
>      }
>  }
>  
> -static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
> -                        JSONWriter *vmdesc)
> -{
> -    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
> -    if (!se->vmsd) {
> -        vmstate_save_old_style(f, se, vmdesc);
> -        return 0;
> -    }
> -    return vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
> -}
> -
>  /*
>   * Write the header for device section (QEMU_VM_SECTION START/END/PART/FULL)
>   */
> @@ -941,6 +930,43 @@ static void save_section_footer(QEMUFile *f, SaveStateEntry *se)
>      }
>  }
>  
> +static int vmstate_save(QEMUFile *f, SaveStateEntry *se, JSONWriter *vmdesc)
> +{
> +    int ret;
> +
> +    if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
> +        return 0;
> +    }
> +    if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
> +        trace_savevm_section_skip(se->idstr, se->section_id);
> +        return 0;
> +    }
> +
> +    trace_savevm_section_start(se->idstr, se->section_id);
> +    save_section_header(f, se, QEMU_VM_SECTION_FULL);
> +    if (vmdesc) {
> +        json_writer_start_object(vmdesc, NULL);
> +        json_writer_str(vmdesc, "name", se->idstr);
> +        json_writer_int64(vmdesc, "instance_id", se->instance_id);
> +    }
> +
> +    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
> +    if (!se->vmsd) {
> +        vmstate_save_old_style(f, se, vmdesc);
> +    } else {
> +        ret = vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    trace_savevm_section_end(se->idstr, se->section_id, 0);
> +    save_section_footer(f, se);
> +    if (vmdesc) {
> +        json_writer_end_object(vmdesc);
> +    }
> +    return 0;
> +}
>  /**
>   * qemu_savevm_command_send: Send a 'QEMU_VM_COMMAND' type element with the
>   *                           command and associated data.
> @@ -1374,31 +1400,11 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>      json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
>      json_writer_start_array(vmdesc, "devices");
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> -
> -        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
> -            continue;
> -        }
> -        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
> -            trace_savevm_section_skip(se->idstr, se->section_id);
> -            continue;
> -        }
> -
> -        trace_savevm_section_start(se->idstr, se->section_id);
> -
> -        json_writer_start_object(vmdesc, NULL);
> -        json_writer_str(vmdesc, "name", se->idstr);
> -        json_writer_int64(vmdesc, "instance_id", se->instance_id);
> -
> -        save_section_header(f, se, QEMU_VM_SECTION_FULL);
>          ret = vmstate_save(f, se, vmdesc);
>          if (ret) {
>              qemu_file_set_error(f, ret);
>              return ret;
>          }
> -        trace_savevm_section_end(se->idstr, se->section_id, 0);
> -        save_section_footer(f, se);
> -
> -        json_writer_end_object(vmdesc);
>      }
>  
>      if (inactivate_disks) {
> @@ -1594,21 +1600,10 @@ int qemu_save_device_state(QEMUFile *f)
>          if (se->is_ram) {
>              continue;
>          }
> -        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
> -            continue;
> -        }
> -        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
> -            continue;
> -        }
> -
> -        save_section_header(f, se, QEMU_VM_SECTION_FULL);
> -
>          ret = vmstate_save(f, se, NULL);
>          if (ret) {
>              return ret;
>          }
> -
> -        save_section_footer(f, se);
>      }
>  
>      qemu_put_byte(f, QEMU_VM_EOF);
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


