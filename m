Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF0680521
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM0k-0001EF-Tm; Sun, 29 Jan 2023 23:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM0j-0001Ds-Bg
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM0h-0005Zz-8F
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053794;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VePif6ytaM14VaX7etyKS2ygHwhmrK8RRbPfy7Ue5us=;
 b=MI463eU979iHr/SF8G36gOziQkPomTocrjG/ipXLh5aRo/D11OncYegWIrPXCsRmrLWOy7
 /NOKi7Xie+lUqbvC0SDuaYkysYbYsDrBwyvENQWmQTBt78IXYbUeRJPNJiV7NT1F/BV5M9
 6lTeqk/kp+o/OC8Z49MXSIv0Mkn0764=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-9d-ttEsjPgSn9kChu1N_ag-1; Sun, 29 Jan 2023 23:43:12 -0500
X-MC-Unique: 9d-ttEsjPgSn9kChu1N_ag-1
Received: by mail-wm1-f71.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so8886684wmq.2
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VePif6ytaM14VaX7etyKS2ygHwhmrK8RRbPfy7Ue5us=;
 b=nd8euCRPVZSkJZGaZ9wDxl8Mk22hNZmv8VaRKF0TirdyFTNpL7pdNYCUQPqqGdIKj2
 6cphxSjTRIwiVmHKMwVIxB59ydHyZYhLnH7vgo2/cXqPZJeWYAM8baEbew8EnuJ10/dE
 yERoYVBD6R5nO6f4Bqt8ur+U3Zlv8vAIf4hq2xYbxO9MIE8+W21saR7h5qqKsmteCtUR
 QOkwX6iIBCXdb9jZ4XTElgmj3t5mfqJYwFSHAVD/PwNN6q9iVTJHqZbKVVlQZ+4cfmdl
 9as0PPY6MRcZ9d3ufXqg0srn4Seewvv+xH92qSe6XS9hLoONNKVfdoADP1jWr4JYG3LU
 X/cw==
X-Gm-Message-State: AO0yUKVnGv0WfqJI2blifOriEn1szK0NcbNgCXOY3Tj3hI37yAlIB7uH
 Qj3K01xuynyQNik6vtlN9W9znXFhA7BLCSkcTyCo+BTSgJiPgO3KvEnIKcgdyoPXl1BLWi7QWpN
 CKybvLADIxw2KE/s=
X-Received: by 2002:a05:600c:3b8f:b0:3dc:4633:9844 with SMTP id
 n15-20020a05600c3b8f00b003dc46339844mr8918457wms.17.1675053791613; 
 Sun, 29 Jan 2023 20:43:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9wuTo+P9pi/hAm3YGxK80Lco6gn3pYYo25z25odahLZcFSb03+rnquF4A6u7o3mff/PJoN2g==
X-Received: by 2002:a05:600c:3b8f:b0:3dc:4633:9844 with SMTP id
 n15-20020a05600c3b8f00b003dc46339844mr8918442wms.17.1675053791434; 
 Sun, 29 Jan 2023 20:43:11 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 fl22-20020a05600c0b9600b003d1e3b1624dsm15700114wmb.2.2023.01.29.20.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:43:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 05/11] tests/qtest/migration-test: Inverse #ifdef'ry
 ladders
In-Reply-To: <20230120082341.59913-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:35
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-6-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:43:09 +0100
Message-ID: <87edrcmy3m.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> This slighly simplify the logic, and eases the following conversion.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


