Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98538C9FE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:22:17 +0200 (CEST)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6yc-0001ta-Sx
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6wz-0000LQ-Vi
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6wx-0006C9-AC
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621610429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfl/Od5PjUbyyIeCLsJgclrl+XulDVhHA+SKikUqbS4=;
 b=PHfT8p70VgJITAw+ad1HgX3ax4mViwMdE+zFDRLGY6f+3cNW+mbm+VePziYVZIJn95TJzW
 AIuVSOymZLNtmIRbQM5TqI4kDGXYN28/1nZijsIPXJMVaJTblejnFOYO4DHkwprRXZ/+Kd
 klPvPAVz0FPHh81gI9SZfg5pEzhVL0w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-dgOPnYqoPpqB8yUpBswicg-1; Fri, 21 May 2021 11:20:28 -0400
X-MC-Unique: dgOPnYqoPpqB8yUpBswicg-1
Received: by mail-ej1-f69.google.com with SMTP id
 i8-20020a1709068508b02903d75f46b7aeso6011888ejx.18
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mfl/Od5PjUbyyIeCLsJgclrl+XulDVhHA+SKikUqbS4=;
 b=OsnBfruX5sp1CGODDE15i/NbXOOM5MyJMar4O70Rkkf72wNc3vs2+jqR4q8iJjxo21
 HgnwLgc6KbwjB/MUPEeXYI9uKgqCx5MsfBvJ1+2psJHYEo+BlJI3ki+wN/0s4x4tXSZR
 XOt33esotkqwi/7AXQqEy+7/9WB9cTnbsK2dOKxdvmuJNGveJUIpgc2sHI0L9sneTHj5
 VMc7/QvaxyaAzbwuQiH3qh2XjaCx6uielPfsj3bxXy9bh16E+0fEwFwJGUeyF/r65LKK
 flB6+uX99VlWW6UxVGz11aNA04wNjaTWMurCeccdc5IUoveSDU9EFj/jZBEmhC2KeN+Y
 /fuA==
X-Gm-Message-State: AOAM5310SW3LbCO5CBrtTawkeUqb3CrSSiNnagk/O4txpIZQUzzVtfL+
 PDIvzjm5T/PYwtstEHYkJ14lex0AzWje/5mzRHuK+37sZ0ItbAP4nOHAIk3W79etfcSbt+f/sFy
 x41DmHdudbHO/JPIk4LOt8TVVe1xVEl/jB74L+v/98p+Js8cMq/jP5szkfkiQxRl4bjk=
X-Received: by 2002:a17:907:1749:: with SMTP id
 lf9mr11233028ejc.178.1621610425368; 
 Fri, 21 May 2021 08:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOHs2pOlbId/MWO4EpWXwLMZVe4PG95HlPzdr5MlBUwdVUveIdQuCsRxUELofZATWvBo/p6g==
X-Received: by 2002:a17:907:1749:: with SMTP id
 lf9mr11233007ejc.178.1621610425060; 
 Fri, 21 May 2021 08:20:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm4015859ejj.68.2021.05.21.08.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 08:20:24 -0700 (PDT)
Subject: Re: [PATCH] hw/scsi: Fix sector translation bug in
 scsi_unmap_complete_noio
To: Kit Westneat <kit.westneat@gmail.com>, qemu-devel@nongnu.org
References: <20210521142829.326217-1-kit.westneat@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56fc3bb8-d6fd-c038-2bcf-8288a5bbacab@redhat.com>
Date: Fri, 21 May 2021 17:20:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521142829.326217-1-kit.westneat@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 16:28, Kit Westneat wrote:
> check_lba_range expects sectors to be expressed in original qdev blocksize, but
> scsi_unmap_complete_noio was translating them to 512 block sizes, which was
> causing sense errors in the larger LBAs in devices using a 4k block size.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/345
> Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
> ---
>   hw/scsi/scsi-disk.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 3580e7ee61..e8a547dbb7 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1582,6 +1582,7 @@ invalid_field:
>       scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
>   }
>   
> +/* sector_num and nb_sectors expected to be in qdev blocksize */
>   static inline bool check_lba_range(SCSIDiskState *s,
>                                      uint64_t sector_num, uint32_t nb_sectors)
>   {
> @@ -1614,11 +1615,12 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
>       assert(r->req.aiocb == NULL);
>   
>       if (data->count > 0) {
> -        r->sector = ldq_be_p(&data->inbuf[0])
> -            * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> -        r->sector_count = (ldl_be_p(&data->inbuf[8]) & 0xffffffffULL)
> -            * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> -        if (!check_lba_range(s, r->sector, r->sector_count)) {
> +        uint64_t sector_num = ldq_be_p(&data->inbuf[0]);
> +        uint32_t nb_sectors = ldl_be_p(&data->inbuf[8]) & 0xffffffffULL;
> +        r->sector = sector_num * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> +        r->sector_count = nb_sectors * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> +
> +        if (!check_lba_range(s, sector_num, nb_sectors)) {
>               block_acct_invalid(blk_get_stats(s->qdev.conf.blk),
>                                  BLOCK_ACCT_UNMAP);
>               scsi_check_condition(r, SENSE_CODE(LBA_OUT_OF_RANGE));
> 

Queued, thanks!

If you want to produce a testcase for tests/qtest/virtio-scsi-test.c, I 
won't complain.

Paolo


