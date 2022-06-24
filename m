Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24045559D65
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:36:14 +0200 (CEST)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lLx-0005l5-7Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o4lEN-0007G3-7q; Fri, 24 Jun 2022 11:28:23 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:47093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o4lEL-0006ij-JR; Fri, 24 Jun 2022 11:28:22 -0400
Received: by mail-ed1-x535.google.com with SMTP id z7so3932626edm.13;
 Fri, 24 Jun 2022 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WB/CdIR1Sfl0LGCR+bWlqHYwhKQsreIlJO0l8F3USmQ=;
 b=N3QDv+mPVYJ1OhrGRL7XQmOlU4TlCjZznQD96BmFUsa6jlTHgAvBhqDBwgqKnB0nwM
 Dzm3kcArrpr26/caEsNTLX4wXiUxX1OUx06aDUiuhmXdtA1phHvYjdcyjyRI8lZZvEDT
 +2xjgq1vkpxZ2kTHcIJeVb87qX4IIVfWRGguHyOn1VWUfu21A5fJ6aSxx4Stc0WDJ+Yt
 7qGaMIireIyXdWI8yBFykM9gSs/6f23E+ZCnPY+QZyHJaYQz2lA4HfcI5pXeLcsG048d
 qaec1QE8NHANNnuP+E2QB5nBlmfD63ra8oHlca81ibGer7+K6SH2yEUfsb6qtd6I0ZiG
 iR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WB/CdIR1Sfl0LGCR+bWlqHYwhKQsreIlJO0l8F3USmQ=;
 b=jCkOUBlYmw/iGI4tk8CvIBOJeoGTLOLBq0f2QfW2VLJdCmArR314+bR6NyUZelAv9N
 MXeOVPHhSVbJJPTB2jaH6ioPCW4MZw3OdI/avEaCgF2y2g+iR4KuQlJA7p+ezmqdTepy
 Um/I37dZMHCQ0DVDew8j50dBmxspjbjaGowLKv6kx1jJ0MX8rOj6xsK253EIBfotwBEv
 pSUDFo12prVvRqHViRb4L19qUXFVg7ytIc/SxcQT04ZBPGr9lUUR6OSTyT5VV/y+zpRv
 7VtZhekOE1htNNwkLukI/VKvofj20iqaJ6n7kBpdrgdnzWtkw+r4URAXPNLt45EOxsJK
 0GAA==
X-Gm-Message-State: AJIora/iH3YTeBeD4lthYk649yvvmUc/nc21Zz5HRKZCbAs4eZILyWyI
 MIstxzftKUBsWQuR1ZiFsII=
X-Google-Smtp-Source: AGRyM1tsgowAcAV8HLdrj3JI7Rreaks5J5d75XClpcSSd49SLGnfXFmwjR2h5Tq5/C9+qJW975jDkw==
X-Received: by 2002:a05:6402:5cb:b0:434:eb48:754f with SMTP id
 n11-20020a05640205cb00b00434eb48754fmr18563196edx.421.1656084499814; 
 Fri, 24 Jun 2022 08:28:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 t15-20020a170906608f00b006f3ef214dc0sm1326908ejj.38.2022.06.24.08.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:28:19 -0700 (PDT)
Message-ID: <d39ec22a-938d-d32a-bcd3-8f5cedb7b23c@redhat.com>
Date: Fri, 24 Jun 2022 17:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-11-eesposit@redhat.com>
 <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
 <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
 <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
 <f59f2894-667c-8940-cc34-2407783b5699@redhat.com>
 <be74272f-f22b-f649-c299-deed65699e2f@yandex-team.ru>
 <b420f70a-6e69-1913-5019-05a8118a49f5@redhat.com>
 <YrXKRWO7tQ9yvFKI@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YrXKRWO7tQ9yvFKI@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/24/22 16:29, Kevin Wolf wrote:
> Yes, I think Vladimir is having the same difficulties with reading the
> series as I had. And I believe his suggestion would make the
> intermediate states less impossible to review. The question is how much
> work it would be and whether you're willing to do this. As I said, if
> reorganising is too hard, I'm okay with just ignoring the intermediate
> state and reviewing the series as if it were a single patch.

I think we've tried different intermediate states for each of the 
previous 6 versions, and none of them were really satisfactory. :(

Paolo

