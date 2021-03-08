Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C18331B0C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 00:42:04 +0100 (CET)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJPVi-0002Mg-TR
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 18:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJPUH-0001p6-Cs
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:40:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJPUF-00020K-9P
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615246829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNpgSDE2jDlATHb1J12CtayPRdMxFRuBtOZPY1HEL8c=;
 b=JJBu+noIGx641UQG0+LoUi0pDFBhRHUAQoERMauo/eub4e7HfUAb9Ctz3cmlSlFF7Igqgk
 zyO+A2TUDuaswXOJ+6Ad32KhaeGOM4glfmKzCZFbyYLhCI2uvgZTrhV71LC8pY9lh+olNf
 LT60yyjiLclI0ayec7dCUijqTk0CeEM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-ubG7mCLmO36CsamDKeDf1Q-1; Mon, 08 Mar 2021 18:40:28 -0500
X-MC-Unique: ubG7mCLmO36CsamDKeDf1Q-1
Received: by mail-qk1-f200.google.com with SMTP id 130so8657794qkm.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 15:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pNpgSDE2jDlATHb1J12CtayPRdMxFRuBtOZPY1HEL8c=;
 b=EdIH1F36vcjaHLAA2iMEk2o8GfToOa7ZtV2zSIGDYUOdycSm63tBiED5TJiBLW1RUY
 K/xugFcpy6fhlW+GAdxlvV8SMZfD3zr1///Xy6CybxRsq/PK9hfW2Y094NhXfGT+2SPx
 bqGDkZdLNSwPjRoLh4Q8uJfVW8EsBPRGmFUPVffJWLMnC15bDf0bxQfF9PIal1OcAoPW
 jbvgVRWm0Qp013kJ/xcZArTARh1HjNTET4uhZOWW8zCAlS5dTDd47TW49lzROjxLdp33
 55UsX29Gh18cd3JhKQy9kHRCh8mrnlzpaL4PfQPNYszFQVjLbaVboZKeASsGLjtUpU85
 XQOA==
X-Gm-Message-State: AOAM5333rcxXBukfDWipeUMCYDETYrHzytaCcPEQUIIfR1PMlT/2UBdp
 n4tNsPaCV26tp5uavuCBF2688JycIalfJWgmD6zkIVer5h5zuGv86Pvyf3L5ivlfd1XNdTVf1H0
 7UpHBag1ab4lzpvY=
X-Received: by 2002:a05:620a:204d:: with SMTP id
 d13mr22855328qka.347.1615246827474; 
 Mon, 08 Mar 2021 15:40:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxozdM1/UvPnRdfi2dIlJrtg0NvOeJC1alEctF6XcMFjS0r6hgfWpD6VmWv2GMBRzTpaCYDDQ==
X-Received: by 2002:a05:620a:204d:: with SMTP id
 d13mr22855311qka.347.1615246827261; 
 Mon, 08 Mar 2021 15:40:27 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id t24sm1715057qto.23.2021.03.08.15.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:40:26 -0800 (PST)
Date: Mon, 8 Mar 2021 18:40:25 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
Message-ID: <20210308234025.GP397383@xz-x1>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210305235414.2358144-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Phil,

On Sat, Mar 06, 2021 at 12:54:13AM +0100, Philippe Mathieu-Daudé wrote:
> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>  
>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>          qemu_printf("address-space: %s\n", as->name);
> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
> +        mtree_print_mr(as->root, 1, 0, as->root->addr,

Root MR of any address space should have mr->addr==0, right?

I'm slightly confused on what this patch wanted to do if so, since then "base"
will always be zero..  Or am I wrong?

Thanks,

> +                       &ml_head, owner, disabled);
>          qemu_printf("\n");
>      }
>  
>      /* print aliased regions */
>      QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
>          qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
> -        mtree_print_mr(ml->mr, 1, 0, &ml_head, owner, disabled);
> +        mtree_print_mr(ml->mr, 1, 0, 0, &ml_head, owner, disabled);
>          qemu_printf("\n");
>      }
>  
> -- 
> 2.26.2
> 

-- 
Peter Xu


