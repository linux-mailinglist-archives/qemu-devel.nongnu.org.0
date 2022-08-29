Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F25A4AD9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 14:00:01 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSdQt-0004J3-VA
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 07:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSdOy-0001OO-0X
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSdOu-0007WF-Ff
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661774275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oxSnDRmisMfWLchtQS61aqg6mrnS6GiJNul7Ks1IAw=;
 b=KpAXKWuDrNdTKFtEgE1sQvWbagm3ZkWiWIDuessQpYt8B0MGpLGYREgjkMrjZJMYe1nFFl
 hh3Gt9VXVWyc3zEMhRojbcMBx3QUmGh+9paPbqPp3DgtRmcdVxhijKrmO50lA/Weyx2vAe
 BU9F/cHcAvyepxw9wJiHYIjxfG8Wc2A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-FTApMkRXOe2L_bizuiReCA-1; Mon, 29 Aug 2022 07:57:54 -0400
X-MC-Unique: FTApMkRXOe2L_bizuiReCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so8356028wmc.2
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 04:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2oxSnDRmisMfWLchtQS61aqg6mrnS6GiJNul7Ks1IAw=;
 b=2ZaEafMgSKM4rN95DMGz816UtUPURivbipsL7lA5F1d96VqCvPx8Wz3SYLy2CZPqnI
 5tskkuo5f0OmWfJpLfFEQTBO6WYkVg+tGfTlwj+H/G10TFi/iC09CFroy7dvI+bTF07D
 5tX71jAEBr1NJykXFSDWGElHnOjZSiIKbWh5zIvC/pF1GL+4nS3SueniwYSIdewaA33V
 xtt79h3Hm+i+b6vr+9jqC85PUNa01WthVrcSA6Q3/7MAVPvA9a0gt+vXxnJ/JC9ymmix
 7P77a/UznkkzZXs03HTIlCa5ELkt46xFMQc0sEEXxCtjAxzgE3NDdLna9Xn0vmSlZKHp
 dhoA==
X-Gm-Message-State: ACgBeo2/4FR+rqOaJ391K1TWxJkgLp2Q55SLQPqPz575qCdlEUVCzNjA
 6xMDjY7jd8EtzEoZy7mk3/u9e9VVXVMtks+3j5P+klHK8xDbxJsUyBZ5sW/tk3kGW5ZLGdg5JPR
 0Fh8h2f0FoFxm3XM=
X-Received: by 2002:a05:600c:a0a:b0:3a6:71e5:fb70 with SMTP id
 z10-20020a05600c0a0a00b003a671e5fb70mr6530833wmp.141.1661774273651; 
 Mon, 29 Aug 2022 04:57:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4WOXTHzu6H3qyUUEPSbuMjdIe1s1KMgl+UxLK71ikjYid4difI4aiwU+CC134N8NnZ842iuA==
X-Received: by 2002:a05:600c:a0a:b0:3a6:71e5:fb70 with SMTP id
 z10-20020a05600c0a0a00b003a671e5fb70mr6530814wmp.141.1661774273375; 
 Mon, 29 Aug 2022 04:57:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-147.web.vodafone.de.
 [109.43.176.147]) by smtp.gmail.com with ESMTPSA id
 v18-20020a1cf712000000b003a5c7a942edsm8452789wmh.28.2022.08.29.04.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 04:57:53 -0700 (PDT)
Message-ID: <65051b6c-94e8-14da-31ef-05b6e1a95a96@redhat.com>
Date: Mon, 29 Aug 2022 13:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org, seiden@linux.ibm.com,
 scgl@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-19-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 18/18] s390x: pv: Add dump support
In-Reply-To: <20220811121111.9878-19-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/08/2022 14.11, Janosch Frank wrote:
> Sometimes dumping a guest from the outside is the only way to get the
> data that is needed. This can be the case if a dumping mechanism like
> KDUMP hasn't been configured or data needs to be fetched at a specific
> point. Dumping a protected guest from the outside without help from
> fw/hw doesn't yield sufficient data to be useful. Hence we now
> introduce PV dump support.
> 
> The PV dump support works by integrating the firmware into the dump
> process. New Ultravisor calls are used to initiate the dump process,
> dump cpu data, dump memory state and lastly complete the dump process.
> The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
> its subcommands. The guest's data is fully encrypted and can only be
> decrypted by the entity that owns the customer communication key for
> the dumped guest. Also dumping needs to be allowed via a flag in the
> SE header.
> 
> On the QEMU side of things we store the PV dump data in the newly
> introduced architecture ELF sections (storage state and completion
> data) and the cpu notes (for cpu dump data).
> 
> Users can use the zgetdump tool to convert the encrypted QEMU dump to an
> unencrypted one.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
[...]
> @@ -207,22 +226,41 @@ static int s390x_write_elf64_notes(const char *note_name,
>                                          DumpState *s,
>                                          const NoteFuncDesc *funcs)
>   {
> -    Note note;
> +    Note note, *notep;
>       const NoteFuncDesc *nf;
> -    int note_size;
> +    int note_size, content_size;
>       int ret = -1;
>   
>       assert(strlen(note_name) < sizeof(note.name));
>   
>       for (nf = funcs; nf->note_contents_func; nf++) {
> -        memset(&note, 0, sizeof(note));
> -        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
> -        note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
> -        g_strlcpy(note.name, note_name, sizeof(note.name));
> -        (*nf->note_contents_func)(&note, cpu, id);
> +        notep = &note;
> +        if (nf->pvonly && !s390_is_pv()) {
> +            continue;
> +        }
>   
> -        note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
> -        ret = f(&note, note_size, s);
> +        content_size = nf->contents_size ? nf->contents_size : nf->note_size_func();
> +        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
> +
> +        /* Notes with dynamic sizes need to allocate a note */
> +        if (nf->note_size_func) {
> +            notep = g_malloc0(note_size);

Either use g_malloc() here (without the trailing "0") ...

> +        }
> +
> +        memset(notep, 0, sizeof(note));

... or put the memset() in an "else" block.

> +        /* Setup note header data */
> +        notep->hdr.n_descsz = cpu_to_be32(content_size);
> +        notep->hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
> +        g_strlcpy(notep->name, note_name, sizeof(notep->name));
> +
> +        /* Get contents and write them out */
> +        (*nf->note_contents_func)(notep, cpu, id);
> +        ret = f(notep, note_size, s);
> +
> +        if (nf->note_size_func) {
> +            g_free(notep);
> +        }
>   
>           if (ret < 0) {
>               return -1;
> @@ -247,12 +285,161 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>       return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, s, note_linux);
>   }
>   
> +/* PV dump section size functions */
> +static uint64_t get_dump_stor_state_size_from_len(uint64_t len)
> +{
> +    return (len / (1 << 20)) * kvm_s390_pv_dmp_get_size_stor_state();

Use "MiB" instead of "1 << 20" ?

> +}
> +
> +static uint64_t get_size_stor_state(DumpState *s)
> +{
> +    return get_dump_stor_state_size_from_len(s->total_size);
> +}

  Thomas


