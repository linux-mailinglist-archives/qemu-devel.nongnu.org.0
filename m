Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA169682A02
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnaL-0000OW-0z; Tue, 31 Jan 2023 05:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnaJ-0000No-1y
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnaH-0001cc-E9
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAPsgFO/VBfBaPPHrW+n0rYoTdEljFYb5qDFkl0cUBY=;
 b=Zjg0osJs83pl54cYTKmkV0P0DuRyZ92ay/iidtfpL7sCou3XrYhbAMaR3huiHFgSXtx0li
 xE8hodABVxRIFco2vP6OfLqeZ0sX3GIW+JNNM3ntYnX4n4NF67NTL1WKvGbRgH9pullRMn
 Uj1myB22S7jN3XQqTQROJJVqf84PkjE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-EZgyFZ2jMWqwItYGDTujaA-1; Tue, 31 Jan 2023 05:09:43 -0500
X-MC-Unique: EZgyFZ2jMWqwItYGDTujaA-1
Received: by mail-qv1-f72.google.com with SMTP id
 px22-20020a056214051600b00537657b0449so8097552qvb.23
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 02:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aAPsgFO/VBfBaPPHrW+n0rYoTdEljFYb5qDFkl0cUBY=;
 b=fBcECIjwoiukqXeo4tKa95DJjmUTHvuKxV98VBQbCl5ZSfidDfQ5kk9mggtFEO+c/N
 tPljFoyX6U3HifbpLxn4JzOsRGzQEQm3e1Jf28BtQQSK6Rq567a4oGKYkYOJyL6j+n9L
 HKlC7ncQVmCBJb2POJ6v58TcrA/P6Q81hKO9jIVwrAgdL9pLZbnFFiE9gHEoG1lual3W
 6tYn+RJne0Jn8+YKGAtMU18Bd5pgNf+QY3SbsmQA5cR8N7/oKDCS1xvphbjJlUN+75Nx
 l70brRA8MD9uRxK7JhduqBZEEkhj987LUtRRVDjfmF5jWkkDQDcvTfiM06K2D8+DEPCF
 KlSw==
X-Gm-Message-State: AO0yUKUKZ7iV3AiB0Q8W/tYOm34uWom5pIHENg+c7cbpv9rfiZE7lzjE
 dDYB0uqgmwr0qsI+VM5c9FvIYVKTjGb0HJ+eDSykhnpUWUTaiHzVb0RTdnm7jHzIgfcHHkF7jK2
 NIZrsytpngU6SN48=
X-Received: by 2002:ad4:4106:0:b0:53a:151:b650 with SMTP id
 i6-20020ad44106000000b0053a0151b650mr17301527qvp.35.1675159782997; 
 Tue, 31 Jan 2023 02:09:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/ueSIyOwOnrRbm3gidT1v1vIxNYtl5hKwQzTPWBHyIddKeFmtI7sVVmw9fglaJmrV90dYlBA==
X-Received: by 2002:ad4:4106:0:b0:53a:151:b650 with SMTP id
 i6-20020ad44106000000b0053a0151b650mr17301505qvp.35.1675159782724; 
 Tue, 31 Jan 2023 02:09:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 e17-20020a05620a015100b0072396cb73cdsm2104833qkn.13.2023.01.31.02.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 02:09:42 -0800 (PST)
Message-ID: <f135077b-3cdc-a548-b783-ff16ee5a516b@redhat.com>
Date: Tue, 31 Jan 2023 11:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/2] audio: make audiodev introspectable by management
 apps
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20230123083957.20349-1-thuth@redhat.com>
In-Reply-To: <20230123083957.20349-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23/01/2023 09.39, Thomas Huth wrote:
> Here's a respin from Daniel's audiodev introspection patches from
> 2021. I've rebased them to the current master branch and addressed
> the review comments from v1.
> 
> The Audiodev QAPI type is not introspectable via query-qmp-schema as
> nothing in QMP uses it. "-audiodev" is not introspectable via
> query-command-line-options because it avoided legacy QemuOpts.
> 
> To fix it, introduce a tiny "query-audiodev" QMP command that uses
> the "Audiodev" QAPI structure, so that it shows up in the schema.
> Then mark the various backend types with conditionals so that only
> the ones that were available at compile time show up in the schema.
> 
> Daniel P. Berrangé (2):
>    qapi, audio: add query-audiodev command
>    qapi, audio: Make introspection reflect build configuration more
>      closely

Since there were no objections and since Gerd seems to be pretty busy with 
other stuff recently, I'll dare to pick these up for my next pull request.

  Thomas


