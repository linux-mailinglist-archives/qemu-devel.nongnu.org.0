Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAC1C3AC1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 15:01:57 +0200 (CEST)
Received: from localhost ([::1]:58156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVajM-0004ns-6W
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 09:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jVaWV-00037o-Ke
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:48:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53325
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jVaWU-0005DC-3s
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588596516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+bXvLcqsRRAef3GpAgUo+6YDFBrnMXDsFxqPOieBs4=;
 b=Qk9qzsMyy8nHNhzrUHm/zvC1ugHTo4PeeXjnUlk347hg+xlF5UkjjPBq1JQVwZGLyA8y7a
 bigOdjKkwErC0mId8P+LdFrZT+DspP2bM4DcUyo/fa9C8Tg+2C/+zfQnoB4BOBUZKIpeRR
 G2Dn4UmmkJsLOmJQfX+OyvbqlzSYYXQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-QFOxlwN0Od2MjeQKX_zKTw-1; Mon, 04 May 2020 08:48:34 -0400
X-MC-Unique: QFOxlwN0Od2MjeQKX_zKTw-1
Received: by mail-wm1-f71.google.com with SMTP id b203so3417020wmd.6
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 05:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+bXvLcqsRRAef3GpAgUo+6YDFBrnMXDsFxqPOieBs4=;
 b=jCcFV6L98AxWF1wGPPQUOr0gvTeiBfc9X9ClLosUYOhCzlZn5Jo44tdehXlopmADJq
 Uh0SWTZYKHF3WslmiBjfFAraoxEBGxtbyA9zTOC5bgO5w6sE/11vAJ+qrrNxWWq2PH2q
 Q78t0da3HSUA6D8NIYg43fRZSeo4W66Vea5yxX2U0P84K4+WmQfyxN3dsHV/lldwVLLp
 OxEvxfeLfA/OGKtfbQ+Zxr0Lxn6jM3CPiBlBHxAy/o1OzkhQvuEnNlfL2SbViFnfbu8j
 shDBCc3H9lgp+684tW4z83sK1FmAcJQyKE3Q4FA+GhsnGzPYBViy0orZHCDO4VOnUSyv
 /YFg==
X-Gm-Message-State: AGi0PuYwhZZoQETelrFP6ryE17kczlTs9So8JoeiMBAgtHU85o+eNymp
 XRWqDVY2XH747qw5xUNVbMTTFqUZr6pgTAqoCkkYDwhSyit9nHJE+ozlZiJ74O0TT6/kCV9kUrj
 hhnjlfV8LLa3iNcQ=
X-Received: by 2002:adf:e487:: with SMTP id i7mr18630353wrm.393.1588596512986; 
 Mon, 04 May 2020 05:48:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypIR3gi2A5hb63AUvEOekiFgzNINT6GjJkSLksSMyJxN6xhsYG+z7AlGDcZUt4cD0wdpxi+/bA==
X-Received: by 2002:adf:e487:: with SMTP id i7mr18630338wrm.393.1588596512819; 
 Mon, 04 May 2020 05:48:32 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.132.175])
 by smtp.gmail.com with ESMTPSA id a7sm12803821wmj.12.2020.05.04.05.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 05:48:32 -0700 (PDT)
Subject: Re: [PATCH 00/17] qom: Spring cleaning
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200428163419.4483-1-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <80ff76e3-3e59-df8f-d943-9429d4cc1d57@redhat.com>
Date: Mon, 4 May 2020 14:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200428163419.4483-1-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/20 18:34, Markus Armbruster wrote:
> Includes one actual bug fix for s390x.

I reviewed everything except patch 8 and it looks good.  Thanks very much!

Paolo


