Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38A2E3701
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 13:12:50 +0100 (CET)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktrOL-0006Gd-Qy
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 07:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ktrMW-0005JB-45
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:10:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ktrMU-0000PA-GL
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609157453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txEAA3vFeMV03zebGgLu27hIwt08jkSfRHQQkXoQtwY=;
 b=XNY1S4FYR6DjIHRmGUL3SnA2F4dd4WMZ6nZVZQljRMpMu9cFE5WfoNCR2hDWraYGbD2618
 2KGgMJ7WKFwz2ntesaIRk+QOnN/MYdDtWPRgTSSt7e1HxFECH8rPOvp8LpNbTOJJVfWTWi
 XJL1fZR1OPhdBVNQhao5o8wv9Olg/3o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-CiEkrfbeN_-ucyNPv6bgAw-1; Mon, 28 Dec 2020 07:10:49 -0500
X-MC-Unique: CiEkrfbeN_-ucyNPv6bgAw-1
Received: by mail-wr1-f71.google.com with SMTP id i4so6310810wrm.21
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 04:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=txEAA3vFeMV03zebGgLu27hIwt08jkSfRHQQkXoQtwY=;
 b=hhJaLBd+OWCnDKDzNZDUUyAexRYrSgfX94tuUc7myQ6lmioiBU3jlDmVF7ejeKi73S
 FzeYePgSwjtyImfABY+FBXWijUjdxJa58JvrwkV0z1eHgsf4BNMWF+4CwLO5NHVxOzax
 3ZTMTr2lJC6FEY5WUFsNL6jT4hDVS8XvNt5lweiK6B421WQcLmc0UdFyzn2cCIckfAL7
 ME1ZW1QEle+c2K1hHC41m/PZRgLkg3QiQkFmQeuu/44u62CUct60edsHpLeyvq1NFb0a
 Ne3iGn7eYZ2lHvxIUjEzHFwj4fPuEr+uPivU4mUw4csbYcDM29mZlHkO9lJW/ixwkzrs
 IyKQ==
X-Gm-Message-State: AOAM530gCxDicRjtcDDNKfqB7vm2dVSKUZwcOe3ZeZz6hWNPabs/+usB
 zYxBB4ydFUt7WIPeLzB8gqo54lFjR+RvoaiQSFFgOUidEUXq+sTZbFH+SgwO3ELPfeOb5VShkOB
 w+9jnm1LoZfsM+qU=
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr50373180wrw.372.1609157448717; 
 Mon, 28 Dec 2020 04:10:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5lGICpulURpxuf7QkbBYwdeOwWVPIknPsuouAhvFVrJC4Fktb/62c0hVMV9CyOiyxSOMInw==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr50373158wrw.372.1609157448514; 
 Mon, 28 Dec 2020 04:10:48 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id l8sm61240341wrb.73.2020.12.28.04.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 04:10:47 -0800 (PST)
Date: Mon, 28 Dec 2020 07:10:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: g00517791 <gaojinhao@huawei.com>
Subject: Re: [PATCH v2 2/3] savevm: Fix memory leak of vmstate_configuration
Message-ID: <20201228071039-mutt-send-email-mst@kernel.org>
References: <20201228090053.346-1-gaojinhao@huawei.com>
 <20201228090053.346-3-gaojinhao@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201228090053.346-3-gaojinhao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 28, 2020 at 05:00:52PM +0800, g00517791 wrote:
> From: Jinhao Gao <gaojinhao@huawei.com>
> 
> When VM migrate VMState of configuration, the fields(name and capabilities)
> of configuration having a flag of VMS_ALLOC need to allocate memory. If the
> src doesn't free memory of capabilities in SaveState after save VMState of
> configuration, or the dst doesn't free memory of name and capabilities in post
> load of configuration, it may result in memory leak of name and capabilities.
> We free memory in configuration_post_save and configuration_post_load func,
> which prevents memory leak.
> 
> Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  migration/savevm.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 5f937a2762..13f1a5dab7 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -314,6 +314,16 @@ static int configuration_pre_save(void *opaque)
>      return 0;
>  }
>  
> +static int configuration_post_save(void *opaque)
> +{
> +    SaveState *state = opaque;
> +
> +    g_free(state->capabilities);
> +    state->capabilities = NULL;
> +    state->caps_count = 0;
> +    return 0;
> +}
> +
>  static int configuration_pre_load(void *opaque)
>  {
>      SaveState *state = opaque;
> @@ -364,24 +374,36 @@ static int configuration_post_load(void *opaque, int version_id)
>  {
>      SaveState *state = opaque;
>      const char *current_name = MACHINE_GET_CLASS(current_machine)->name;
> +    int ret = 0;
>  
>      if (strncmp(state->name, current_name, state->len) != 0) {
>          error_report("Machine type received is '%.*s' and local is '%s'",
>                       (int) state->len, state->name, current_name);
> -        return -EINVAL;
> +        ret = -EINVAL;
> +        goto out;
>      }
>  
>      if (state->target_page_bits != qemu_target_page_bits()) {
>          error_report("Received TARGET_PAGE_BITS is %d but local is %d",
>                       state->target_page_bits, qemu_target_page_bits());
> -        return -EINVAL;
> +        ret = -EINVAL;
> +        goto out;
>      }
>  
>      if (!configuration_validate_capabilities(state)) {
> -        return -EINVAL;
> +        ret = -EINVAL;
> +        goto out;
>      }
>  
> -    return 0;
> +out:
> +    g_free((void *)state->name);
> +    state->name = NULL;
> +    state->len = 0;
> +    g_free(state->capabilities);
> +    state->capabilities = NULL;
> +    state->caps_count = 0;
> +
> +    return ret;
>  }
>  
>  static int get_capability(QEMUFile *f, void *pv, size_t size,
> @@ -515,6 +537,7 @@ static const VMStateDescription vmstate_configuration = {
>      .pre_load = configuration_pre_load,
>      .post_load = configuration_post_load,
>      .pre_save = configuration_pre_save,
> +    .post_save = configuration_post_save,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(len, SaveState),
>          VMSTATE_VBUFFER_ALLOC_UINT32(name, SaveState, 0, NULL, len),
> -- 
> 2.23.0


