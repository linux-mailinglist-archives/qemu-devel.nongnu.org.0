Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A3610CD4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLOD-0005fn-Qm; Fri, 28 Oct 2022 05:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooLOA-0005bX-Pj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooLO8-0005px-TJ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666948251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbJAcgDDQytrSQWae++uLACU5T9cG9/pGS2S9pmgUXg=;
 b=fVdmHkNZcEYQAs3+aA5N5PaYpO/VL5ZONhZXxLNVveoCTvZ6Fg9ZbEPlO9awQwwIWoyg7m
 m0aG2ZneK4QrxOG2mSwhbQSaNYhwrGh86tDfXJBz1c7t+he/qaalpDqkdhMBkxsrhuu0y9
 t+TD3/1qnxn/QpGHqgLIA6J+0FzWio0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-qwvMwtpPPGy8bYlIlktnTg-1; Fri, 28 Oct 2022 05:10:49 -0400
X-MC-Unique: qwvMwtpPPGy8bYlIlktnTg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso4134200wmb.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HbJAcgDDQytrSQWae++uLACU5T9cG9/pGS2S9pmgUXg=;
 b=USJWzhvyj2CjVZV2oMEUzu3t/K0QV+6JoXl44f/ZSpWuv+tw2F0qKvt0iVpM7E00hi
 XIq/NgW8xqfBDodSybDbW+KAIj6xq28YnJzv1/aW0l3zR+Ln00FJz/0d3FyYZWkYwh5q
 6UpbnMwY4hNNsTSKWut30zgoHXbDsmZ5gMEdERhpa3n4f9we8lvt3Ds5U6mF8REKAKe5
 cv5aveBW4pPz5G/3ryvjqwnQ2/ZN6bQgZfJOqsCWw6fXIh6lA10xFTTzIQbp0wbWpcWk
 PKw7ejxli4gPfIK+CybspYt0hmk/Rn34AHZKHfFYHfH1WUgFeFb6EnB+gQTNxmw/6LI4
 xiuA==
X-Gm-Message-State: ACrzQf3DBNyDD0OpOo9ZhjLFVETvlS8rt3RFgRtIqB6ZiusSKAKe46Av
 4uDT0hFGCY79+/m/NauQfl3L4Sw0FjC5aidy/Hfy8hMlOKf6U/xL/sd0BI1oA2EyiO+gafDWYyN
 3QMeT9h4rXLCC9f4=
X-Received: by 2002:a05:600c:4e94:b0:3c6:f648:9a29 with SMTP id
 f20-20020a05600c4e9400b003c6f6489a29mr8977613wmq.59.1666948248814; 
 Fri, 28 Oct 2022 02:10:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5D4Xi7ttVZzHT7JOmvCZPSpEltSzyKTZbYjbU/oa5YDKzyXc21/mF/VYpPgn5mlzqbXUnkRA==
X-Received: by 2002:a05:600c:4e94:b0:3c6:f648:9a29 with SMTP id
 f20-20020a05600c4e9400b003c6f6489a29mr8977589wmq.59.1666948248506; 
 Fri, 28 Oct 2022 02:10:48 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003c21ba7d7d6sm3487717wmd.44.2022.10.28.02.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 02:10:47 -0700 (PDT)
Message-ID: <b18aa98a-e251-f5cd-ecca-4d3aa27bb374@redhat.com>
Date: Fri, 28 Oct 2022 11:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: megasas regression in 7.1?
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
References: <4A0D1260-DB8D-47CA-9369-6F3C0B7296C9@oracle.com>
Cc: Hannes Reinecke <hare@suse.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Millikin <john@john-millikin.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4A0D1260-DB8D-47CA-9369-6F3C0B7296C9@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 07.47, John Johnson wrote:
> 
> 	I pulled 7.1, and the megasas driver stopped being able to do reads from a disk.
> It looks to be related to this commit:
> 
> https://github.com/qemu/qemu/commit/fe9d8927e265fd723a6dc87cd6d220f4677dbe1f#diffe3f5f30efc54747e0624dca63e5f55f0012736c1875b6e85526b3514e6911be3
> 
> which added some command buffer bounds checking to the SCSI subsysem.  Unfortunately,
> when the megasas QEMU emulation receives a direct I/O command from the device driver
> in megasas_handle_io(), it synthesizes a SCSI command from it in megasas_encode_lba(),
> but passes the command buffer length from the driver frame instead of the length of the
> buffer it synthesized the SCSI command in.  The driver (at least the Linux 4.14 version
> I’m using) does not fill in the command buffer length in direct I/O frames, so
> scsi_req_new() sees a 0 length command and fails it.
> 
> 
> 	I worked around this issue with:
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 7082456..6e11607 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1823,7 +1823,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>   
>       megasas_encode_lba(cdb, lba_start, lba_count, is_write);
>       cmd->req = scsi_req_new(sdev, cmd->index,
> -                            lun_id, cdb, cdb_len, cmd);
> +                            lun_id, cdb, sizeof (cdb), cmd);
>       if (!cmd->req) {
>           trace_megasas_scsi_req_alloc_failed(
>               mfi_frame_desc(frame_cmd), target_id, lun_id);
> 
> and the driver can read the disk again, but I’m not sure this is the correct
> fix since cdb_len is used for bounds checking elsewhere in megagsas_handle_io(),
> although a 0 won’t fail there.
> 
> 	Is there anyone with megasas experience who could comment on this?

No clue about that megasas problem, but it might help if you put the experts 
on CC: (which can be found in the MAINTAINERS file). Done now.

  Thomas


