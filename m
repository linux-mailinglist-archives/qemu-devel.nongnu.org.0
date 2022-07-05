Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B456733D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:49:35 +0200 (CEST)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8knu-0005w7-8S
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kl6-0003RX-ML
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kl2-0000vS-T6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657035996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QzyjMXHHXHopxLH7HDw8nPxsrIouY0eW1oJX93jax0=;
 b=ERl/MV4w2vvd0YDzl1X+DFDAcJfe+kfFaSpyxCLiYF10kphXD3nGCqUMsGYkAHFklpOUw3
 5gvpMuXpVs30AmuQxUCwCkwM3eLdE5QIm3cCGaW8/G0flDy/tujVaiZcxdIrvxPbJAggi9
 veFVSxiNspp6KozrNaoEdrPZu6ZfoYs=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-IaroEDkjOL6nBO85bPMkdA-1; Tue, 05 Jul 2022 11:46:35 -0400
X-MC-Unique: IaroEDkjOL6nBO85bPMkdA-1
Received: by mail-yb1-f198.google.com with SMTP id
 c7-20020a258807000000b0066d6839741eso10013881ybl.23
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=6QzyjMXHHXHopxLH7HDw8nPxsrIouY0eW1oJX93jax0=;
 b=tzPF8LXN/wJw2j+urZCHMeZCU64Vt7UJMe+IzXs4/gt12vssRbP8/9DxDJ86oWy6WK
 lnFdZSe7vC6i3IDyqsQjLPJtbcN7ywwBS2m0AbaELEHo0G/Y6fmar44kbupHKjOqelp3
 7eHBou/foh3c/9kfW/JSLVsE2jQ/ALHsvdFRpvUxVoUrlI+r9/EfMo3YBM6WENr3VdRU
 mhimfijHw+7w3LXXf7vjByrUgtlX+bRouFPp1IfRAmOwI/vj4Xw98iu0UjkR6gbAguAn
 jH1qFh12z1Pw4DQjhTNjmrXKwdOpPRRispZ93jQpRRPPOYcQZ5AFoDK31j9fy7vkYK5C
 Fg9w==
X-Gm-Message-State: AJIora9m4EOMI3w4akf3xXaBKyfHaKZ/0S235FROdxXbjR3YhXVxfP2f
 i2k8LZ86JbAmdgo4d5p9Bcv8/ydUPzp+iOyFTkuwinnrXuf75Y3iCsFz3wveSiQaEjT6D46ktzu
 yO5MubMPItIse5QjyFezQdBPffC6RBcI=
X-Received: by 2002:a25:3085:0:b0:66e:4440:f42e with SMTP id
 w127-20020a253085000000b0066e4440f42emr13329748ybw.403.1657035994750; 
 Tue, 05 Jul 2022 08:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWJKiH/QvCHkl4yFXM0CF+1id+OGWT9iIpsvcJlnhNcOpXHVUYra/Gv9j99NJRkflr7fzHHCHIlyz6a54J5A4=
X-Received: by 2002:a25:3085:0:b0:66e:4440:f42e with SMTP id
 w127-20020a253085000000b0066e4440f42emr13329722ybw.403.1657035994480; Tue, 05
 Jul 2022 08:46:34 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Jul 2022 08:46:34 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220617121932.249381-1-victortoso@redhat.com>
Date: Tue, 5 Jul 2022 08:46:34 -0700
Message-ID: <CABJz62Pay+VzT8gy94bgRJdXHrdGM=GQCWcwVKkj9eso_SzP3w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I've commented in detail to the single patches, just a couple of
additional points.


On Fri, Jun 17, 2022 at 02:19:24PM +0200, Victor Toso wrote:
> * 7) Flat structs by removing embed types. Discussion with Andrea
>      Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01590.html
>
>      No one required it but I decided to give it a try. Major issue that
>      I see with this approach is to have generated a few 'Base' structs
>      that are now useless. Overall, less nested structs seems better to
>      me. Opnions?
>
>      Example:
>       | /* This is now useless, should be removed? */
>       | type InetSocketAddressBase struct {
>       |     Host string `json:"host"`
>       |     Port string `json:"port"`
>       | }

Can we somehow keep track, in the generator, of types that are only
used as building blocks for other types, and prevent them from
showing up in the generated code?


Finally, looking at the repository containing the generated code I
see that the generated type are sorted by kind, e.g. all unions are
in a file, all events in another one and so on. I believe the
structure should match more closely that of the QAPI schema, so e.g.
block-related types should all go in one file, net-related types in
another one and so on.


Looking forward to the next iteration :)

-- 
Andrea Bolognani / Red Hat / Virtualization


