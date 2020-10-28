Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539B29D22F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 22:00:12 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXsYF-00009b-Gd
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 17:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXsW2-0007a8-J2
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 16:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXsW0-0004kK-ER
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 16:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603918671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcmzX7GbS7bXVTSaUB2KrWAJO148oT3sbS5sWrNsckY=;
 b=XYhErkkPLwk77o9MMOsokHefEhqKNvyNNQ/cuRZ4GUrq6xt1lJdRwOtSJw/t7c7Qfzgok+
 ZzK/XjT0FENZJ2W+OCbdM8js+y/rbfCV8tsoBuj+8vbzNZIu/7Cx2n3zrdjCXcVtYY2/+w
 6OB3lpqG7j7y9MUkbnvDiasjcQ/Eyq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-ix3TMMBPOISN6xeB_gFGDQ-1; Wed, 28 Oct 2020 16:57:49 -0400
X-MC-Unique: ix3TMMBPOISN6xeB_gFGDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6878030C2;
 Wed, 28 Oct 2020 20:57:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5DFB60BF1;
 Wed, 28 Oct 2020 20:57:43 +0000 (UTC)
Subject: Re: [PATCH] hw/timer/renesas_tmr.c cleanup read operation.
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200711154242.41222-1-ysato@users.sourceforge.jp>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <28b04149-bbd9-12ed-0e40-3c3da9fee672@redhat.com>
Date: Wed, 28 Oct 2020 21:57:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200711154242.41222-1-ysato@users.sourceforge.jp>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 11/07/2020 17.42, Yoshinori Sato wrote:
> Cleanup read operation.
> This module different return of access size.

The last sentence is hard to read, could you maybe rephrase it?

> -    case A_TCORB:
> -        if (size == 1) {
> +        case A_TCORB:
>              return tmr->tcorb[ch];
> -        } else {
> -            return concat_reg(tmr->tcorb);

So with size == 2 and addr == TCORB you were returning tmr->tcorb here...

> -        }
> -    case A_TCNT:
> -        return read_tcnt(tmr, size, ch);
> -    case A_TCCR:
> -        if (size == 1) {
> +        case A_TCNT:
> +            return read_tcnt(tmr, size, ch);
> +        case A_TCCR:
>              return read_tccr(tmr->tccr[ch]);
> -        } else {
> -            return read_tccr(tmr->tccr[0]) << 8 | read_tccr(tmr->tccr[1]);
> +        default:
> +            qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
> +                          " not implemented\n",
> +                          addr);
> +            break;
> +        }
> +    case 2:
> +        switch (addr) {
> +        case A_TCORA:
> +            return concat_reg(tmr->tcora);
> +        case A_TCORB:
> +            return concat_reg(tmr->tcora);

... but in the new code, you are now returning tmr->tcora ... copy-n-paste
error?

> +        case A_TCNT:
> +            return read_tcnt(tmr, size, ch);
> +        case A_TCCR:
> +            return read_tccr(tmr->tccr[ch]) << 8 | read_tccr(tmr->tccr[1]);
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "renesas_tmr: Register 0x%" HWADDR_PRIX
> +                          " invalid access size\n",
> +                          addr);
> +            break;
>          }
> -    default:
> -        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
> -                                 " not implemented\n",
> -                      addr);
> -        break;
>      }
>      return UINT64_MAX;
>  }
> 

 Thomas


