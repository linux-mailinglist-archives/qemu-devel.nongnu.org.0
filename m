Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996806D7C50
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:21:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk27N-00058c-UR; Wed, 05 Apr 2023 08:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk27K-000585-W7
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk27H-0007PE-Ie
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680697194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbw+59Jdxeaov8DhB5sDx8/rv5UxpgMjMOkuu1zxhiM=;
 b=iK26V3qE5mO1jLYCRZB2549prLYd17a6ZX8vFM9ZxjRLeIcZf+yClvv8c7nLysPraEqyF2
 Z+SxWNw8TC1ehHM5u1lZAMvgYmCGEyeJOL4FF7mVlcV5RS40cGI2MIY2Xe55DyaxJcMjds
 BVzgrPkMJ5/bom+1tM7USI/P/0GccGg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-i-6WomoQPNiGLXRkVlADWw-1; Wed, 05 Apr 2023 08:19:53 -0400
X-MC-Unique: i-6WomoQPNiGLXRkVlADWw-1
Received: by mail-vs1-f69.google.com with SMTP id
 b1-20020a67b201000000b0041f41eaafefso12334687vsf.11
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680697192; x=1683289192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbw+59Jdxeaov8DhB5sDx8/rv5UxpgMjMOkuu1zxhiM=;
 b=NwBeB48Ph3hR/p//675pzrEwRhTtBpI2KCsnx0Dp2kBng1o5j2KQTFBLaBCxhzR4z5
 Z6AY4D1A7X407orMDhIMtSLWT8kzQeHXw5LRaySkq7ztlb24vMcKBf1mnrw93w/JOu57
 zprbvjffiooTYzwozdEhK2npGyz2tFb9NyHnMlTTqnjWEtioMjycy+cGGJm0yiJO3qeS
 LH5l2vHmZznCTQ+EXlsqbdEUAb5PJ11tvyDoY+aRXVRApFr7es8HbyocFD9ZOkxk1aWl
 +UYNtRjmxnGO6ohyLG2oHO1ZX5P1NL3x0bBaE1ZDP6iWS0mNbdVZ3Q/Il2RGNUyFztCs
 FQqg==
X-Gm-Message-State: AAQBX9cIhSUxnBSqYcW9Yr3hcDyQwvwAgxuXdBOl7C4GcJWNM6579uh/
 dYv7VhhG8O27GL4JnuPjJFf0MrhkVr2pRNsGYRJj4VFlB/jbmVG2tahByF82Gs7JrIJwcb16rRV
 q3/cjPCs3s7KLJ/v0MOZta2RbaRBpoY0VR7j42K4=
X-Received: by 2002:a1f:ac89:0:b0:410:4a2c:1e9a with SMTP id
 v131-20020a1fac89000000b004104a2c1e9amr4589334vke.1.1680697192316; 
 Wed, 05 Apr 2023 05:19:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350aFCINILnDLM9VykPFsN6uy/u14BS66SZW1PEk2CQnTwlwxcTI3SFfJ5mPgPFWH6xjcoM8VO/XoxH+r3rbfADQ=
X-Received: by 2002:a1f:ac89:0:b0:410:4a2c:1e9a with SMTP id
 v131-20020a1fac89000000b004104a2c1e9amr4589322vke.1.1680697192069; Wed, 05
 Apr 2023 05:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230309085051.308664-1-pbonzini@redhat.com>
In-Reply-To: <20230309085051.308664-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 5 Apr 2023 14:19:40 +0200
Message-ID: <CABgObfbuwYz719Gb9+jCYdDYSB9yjE3mS+bv2A5OK1AcSWSeqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] block: remove separate bdrv_file_open callback
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On Thu, Mar 9, 2023 at 9:50=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
> The value of the bdrv_file_open is sometimes checked to distinguish
> protocol and format drivers, but apart from that there is no difference
> between bdrv_file_open and bdrv_open.
>
> However, they can all be distinguished by the non-NULL .protocol_name
> member.  Change the checks to use .protocol_name instead of .bdrv_file_op=
en,
> and unify the two callbacks.

Ping.

Paolo


