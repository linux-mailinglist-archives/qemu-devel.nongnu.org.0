Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B054DC41E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:41:53 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnZo-0000Nt-OY
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:41:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnNW-0007Ds-P4
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnNU-0007AB-U3
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647512945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNy84Wa0ghft7ajaj70VKnPl0wXvbJS/FVKi32awQ5I=;
 b=VYHbVcfEFRZTW3a6lUKDw+LBnvJvv7dHdGtJ7Umn16rjgCFB51hZOKTTrI5AxjnX/viXtj
 Sg6ZtAO3tylh3oolGmkKiSZLR3BxemdDViLni32gaEdvmkxep4NHlsvQc7MoRslH3nS2kR
 ROIQybSPlw2QaVtvB4/q9lXRFkVwtnc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-1ILeNmIsPa2yrqG8me6DrQ-1; Thu, 17 Mar 2022 06:29:05 -0400
X-MC-Unique: 1ILeNmIsPa2yrqG8me6DrQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso2653016eje.13
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oNy84Wa0ghft7ajaj70VKnPl0wXvbJS/FVKi32awQ5I=;
 b=eI19QqlmOrZHtUPto/n1K74MTEO5z0FcS9YoGQSF6I96Jb8vegP2KrxG+DddNVTjsW
 BRiay3ZanPZ+HruDASqe7S9OZNDKVQTBxe9hi0AoxLgOxGRwKVRuh3WldUqG/MGEf+LC
 +uA8NjPVO6EJhHJLTuhRq+BGJv9W0D+jVrfoUMj936dzXPO0dr0QhVa6DwzJrl2sKrq3
 HQ6cUZ1MC5ULQJ9qNYw8TE1E1BmvuuNIfUtQ7GqgcSV7gsz+IXT3KRxLvQ1tKbhbj+Rt
 Oq1o5PRdI2gAn1ZSPDVSwxoOFGYn7uocI2KK1LeoVr0MyHtxJUg7u/haSdVxodrTaAlH
 ozUQ==
X-Gm-Message-State: AOAM531YFSn9bBQ5K+TpfjMmgAEkl/MPQI8P8fpFP5z0Mkrk09QHCyE2
 MG05mwVU1sMJdpdpfk/XV8DNgPboTf49MtM3czbuCLUiV7mwbLY0CDDbom4OlS0eE1Ca0lDSkqk
 L7/6VGI15L24HpI8=
X-Received: by 2002:a17:907:60d5:b0:6da:a62d:1845 with SMTP id
 hv21-20020a17090760d500b006daa62d1845mr3819964ejc.154.1647512943693; 
 Thu, 17 Mar 2022 03:29:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBhNJdagW71W95qMvp3fJoALGeYgNzRTvY51gseFhgHt54qraTAeGqiVQT590eTPM3OI4QkQ==
X-Received: by 2002:a17:907:60d5:b0:6da:a62d:1845 with SMTP id
 hv21-20020a17090760d500b006daa62d1845mr3819948ejc.154.1647512943513; 
 Thu, 17 Mar 2022 03:29:03 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 m28-20020a17090672dc00b006df88565a2dsm1362372ejl.121.2022.03.17.03.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:29:03 -0700 (PDT)
Message-ID: <89bc26f7-fb8e-1391-3d79-b2c8ec843641@redhat.com>
Date: Thu, 17 Mar 2022 11:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/5] python/utils: add add_visual_margin() text
 decoration utility
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220308015728.1269649-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:57, John Snow wrote:
>>>> print(add_visual_margin(msg, width=72, name="Commit Message"))
> ┏━ Commit Message ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
> ┃ add_visual_margin() takes a chunk of text and wraps it in a visual
> ┃ container that force-wraps to a specified width. An optional title
> ┃ label may be given, and any of the individual glyphs used to draw the
> ┃ box may be replaced or specified as well.
> ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   python/qemu/utils/__init__.py | 78 +++++++++++++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)

Acked-by: Hanna Reitz <hreitz@redhat.com>


