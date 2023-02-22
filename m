Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28FC69F404
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUnsx-0001JJ-4G; Wed, 22 Feb 2023 07:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUnst-0001F3-QU
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUnss-0007je-4G
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677067564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTPz3TYJ3OzwWX2EnggyNaRaeNo6Pbdz21JfrwS8EOk=;
 b=To24J4bATo1k1ZVHerm2xE+eyonuOzRXXE1vDjKaPiiF55E9rgOF9lPoe3AFk3gTPqsqv4
 9JctsRBMtmif2D3hUTEH90Rfrt6IbwIngN4hMucPl5OngUPRKWl2hx21DwlfvvtoDU3HxB
 tM+tzW5op4PpWyrma11iynTkI9PQ54Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-wq5Oif__OrOOULpoAFVJ9Q-1; Wed, 22 Feb 2023 07:06:03 -0500
X-MC-Unique: wq5Oif__OrOOULpoAFVJ9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so3440496wml.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 04:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uTPz3TYJ3OzwWX2EnggyNaRaeNo6Pbdz21JfrwS8EOk=;
 b=K7cz35uHTh5L/dBuUTuZVwwnsDXldI2OxJkDnvAtw+sGxSeVovG2EBHgXR9nzqZHVG
 T0DBN/K/M8TtLWk5S0d/cy9gvD6Nq90XozHHmpAr9UBUShCkYyMZm0bLkxiFIZAjlLR9
 wrqB/e26wUemh2HnviHEnump1dZMqYAzYwfpDmzf1IHad83YPA8oegd8KrwEQJa+lmgU
 unP9gIJW4wBSx+MFHby2S2X3SiU+LUbOt0OFUmNwDpmNOMs9fNW7rQjaLMvnvhN8TFSo
 cCuc36xBwekcQeODp+YFTUl2FBJ+hhSe1clHmT53sFD99G39jLhla1fXu6JkgryeM8SO
 oWLw==
X-Gm-Message-State: AO0yUKV11PR8WP073mg393viWDi0EYblto2umVAM0HbpIU9wsMmaD3e7
 IF6xN2F3mQlXeDWxSqzYwjxt84nOR6iwMT+eZD8tVqLmTmkvW0ihuqC9w4TfVgQXupIThgaSv6D
 utNRjBCanNZ3Yewot4Onh
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id
 a14-20020a5d570e000000b002bfd94029b6mr7024308wrv.54.1677067561950; 
 Wed, 22 Feb 2023 04:06:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9kkHo97Zm+s9ewGEjUtantQ8uAUFumorkHRU5mc0Wpwk4GiLhiFUVQbe7ZcH80P7F7qJsuuQ==
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id
 a14-20020a5d570e000000b002bfd94029b6mr7024282wrv.54.1677067561673; 
 Wed, 22 Feb 2023 04:06:01 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm7842832wru.84.2023.02.22.04.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:06:01 -0800 (PST)
Date: Wed, 22 Feb 2023 07:05:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Message-ID: <20230222070529-mutt-send-email-mst@kernel.org>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221232520.14480-6-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 262a69f428 ("osdep.h: Prohibit disabling
> assert() in supported builds") 'NDEBUG' can not be defined.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

this exactly says NDEBUG is not allowed. why are you removing this?
  
> ---
>  hw/scsi/mptsas.c   | 2 --
>  hw/virtio/virtio.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index c485da792c..5b373d3ed6 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
>      n = qemu_get_be32(f);
>      /* TODO: add a way for SCSIBusInfo's load_request to fail,
>       * and fail migration instead of asserting here.
> -     * This is just one thing (there are probably more) that must be
> -     * fixed before we can allow NDEBUG compilation.
>       */
>      assert(n >= 0);
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..c6b3e3fb08 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
>  
>      /* TODO: teach all callers that this can fail, and return failure instead
>       * of asserting here.
> -     * This is just one thing (there are probably more) that must be
> -     * fixed before we can allow NDEBUG compilation.
>       */
>      assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
>      assert(ARRAY_SIZE(data.out_addr) >= data.out_num);
> -- 
> 2.38.1


