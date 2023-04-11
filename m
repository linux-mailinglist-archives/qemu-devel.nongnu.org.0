Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F76DE00F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:53:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmGJ7-0007eN-7T; Tue, 11 Apr 2023 11:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmGJ0-0007bc-35
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:53:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmGIx-0003G6-UR
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:53:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50489c9f455so2318159a12.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681228389; x=1683820389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+afAUhJmb3CenEybg7a7RULX1wlufoDfdzomO9GDRYA=;
 b=RNhJYeyexM8PJOpvSQvGVFf0XxuM6WnxRNVlXLYaAsYeZNzubp6MDjpgYtOgwZKQdr
 rKLLJVNwBswDzELe/rQntOLHkhfszIQBhfbb7z1gGz66H5ts3eD83tHq72AAdXxdKo78
 cxnkQGcE94u1oFEUgN1EenyCMyXsYBPkePpc3/etlgAat9lkvyltuQ5CE81sAOzr/0s/
 Oi0XEXx2fC3sd0L/cQ6eWoDaS3/cKHrnT0/9aZB1FUFwg2Im/NSUTw/3ZWGFJJHXks1Q
 puhxSQ8kXQCB1UPwRG00XBTd8hhLXDAOWj/eoDAvmTh5SD7ofkc2j6BT1hBdA+/jHQWf
 g8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228389; x=1683820389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+afAUhJmb3CenEybg7a7RULX1wlufoDfdzomO9GDRYA=;
 b=YFN+gmj85t89tp4myhtCKYCdCkn7DranMhkdew5CIPOZ74SlK+00Vr6kG1mPxYV87k
 zKIMJ97iq2NRdOAyENAqjqxck4CPnWc8LxTgHExMftC+BCC38nVdqF/kHpR1dRNYW1k5
 3A98Tm+jSQY2xyO/yXtsGDRoFtMkvrTi8gecNwfNYoD1nvLuNgkpRqXTkYhGebyQVKGT
 UWbSZh+RtoaV7VZxfF8QjFgA6ViQZwZkk3Jvk3LGsX7iDnwUIn5kHdC3C5MgTZrhhk22
 ojuncz11ODDm7ExQrQ/Cw6fIphR6ycwDzpYKzT3/9YUJzVw3cPNLgIxwv+F2R2eYjW1l
 YJkQ==
X-Gm-Message-State: AAQBX9e5WPmkC0Nuu0QSSoVv/kCjajjsq+M4/CzSiHiL+WBPUsroFjFY
 i2tUo3WiysW7p20eSVGWGbOs20z8RF+jovM8qJEUnA==
X-Google-Smtp-Source: AKy350b22sKPsTTuCmlkmNx2I4IoBkaVSAGJ0Q875VqWm26+MDdc4aZNDNRecwOpNI4sbZDK4aBbOyffPyV53q5b1PM=
X-Received: by 2002:a50:9fe1:0:b0:504:87d8:ac39 with SMTP id
 c88-20020a509fe1000000b0050487d8ac39mr1481994edf.6.1681228388798; Tue, 11 Apr
 2023 08:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-24-mst@redhat.com>
In-Reply-To: <20221107224600.934080-24-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 16:52:58 +0100
Message-ID: <CAFEAcA-g0w4K6KfEP0MmHGRhL_8LmfxPBYiLSMG4KMakKHe=UA@mail.gmail.com>
Subject: Re: [PULL v4 23/83] hw/cxl/cdat: CXL CDAT Data Object Exchange
 implementation
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Huai-Cheng Kuo <hchkuo@avery-design.com.tw>, 
 Chris Browy <cbrowy@avery-design.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Ben Widawsky <ben.widawsky@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 7 Nov 2022 at 22:49, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
>
> The Data Object Exchange implementation of CXL Coherent Device Attribute
> Table (CDAT). This implementation is referring to "Coherent Device
> Attribute Table Specification, Rev. 1.03, July. 2022" and "Compute
> Express Link Specification, Rev. 3.0, July. 2022"
>
> This patch adds core support that will be shared by both
> end-points and switch port emulation.

> +static void ct3_load_cdat(CDATObject *cdat, Error **errp)
> +{
> +    g_autofree CDATEntry *cdat_st = NULL;
> +    uint8_t sum = 0;
> +    int num_ent;
> +    int i = 0, ent = 1, file_size = 0;
> +    CDATSubHeader *hdr;
> +    FILE *fp = NULL;
> +
> +    /* Read CDAT file and create its cache */
> +    fp = fopen(cdat->filename, "r");
> +    if (!fp) {
> +        error_setg(errp, "CDAT: Unable to open file");
> +        return;
> +    }
> +
> +    fseek(fp, 0, SEEK_END);
> +    file_size = ftell(fp);

Coverity points out that ftell() can fail and return -1...

> +    fseek(fp, 0, SEEK_SET);
> +    cdat->buf = g_malloc0(file_size);

...which would cause an attempt to allocate a very large
amount of memory, since you aren't checking for errors.
CID 1508185.

Below, some other issues I saw in a quick scan through the code.

> +
> +    if (fread(cdat->buf, file_size, 1, fp) == 0) {
> +        error_setg(errp, "CDAT: File read failed");
> +        return;
> +    }

(The issues in this bit of code I've mentioned in a
different thread.)

> +
> +    fclose(fp);
> +
> +    if (file_size < sizeof(CDATTableHeader)) {
> +        error_setg(errp, "CDAT: File too short");
> +        return;
> +    }

> +    i = sizeof(CDATTableHeader);
> +    num_ent = 1;
> +    while (i < file_size) {
> +        hdr = (CDATSubHeader *)(cdat->buf + i);

If the file is not a complete number of records in
size, then this can index off the end of the buffer.
You should check for that.

> +        cdat_len_check(hdr, errp);
> +        i += hdr->length;
> +        num_ent++;
> +    }
> +    if (i != file_size) {
> +        error_setg(errp, "CDAT: File length missmatch");

Typo: "mismatch"

> +        return;
> +    }
> +
> +    cdat_st = g_malloc0(sizeof(*cdat_st) * num_ent);

To allocate an array of N lots of a structure, use
g_new0(), which will take care to avoid possible
overflow in the multiply.

> +    if (!cdat_st) {
> +        error_setg(errp, "CDAT: Failed to allocate entry array");

g_malloc0() and g_new0() can never fail, so you don't need
to check for a NULL pointer return.

> +        return;
> +    }
> +
> +    /* Set CDAT header, Entry = 0 */
> +    cdat_st[0].base = cdat->buf;
> +    cdat_st[0].length = sizeof(CDATTableHeader);
> +    i = 0;
> +
> +    while (i < cdat_st[0].length) {
> +        sum += cdat->buf[i++];
> +    }
> +
> +    /* Read CDAT structures */
> +    while (i < file_size) {
> +        hdr = (CDATSubHeader *)(cdat->buf + i);
> +        cdat_len_check(hdr, errp);

We already did this check the first time through the data...

> +
> +        cdat_st[ent].base = hdr;
> +        cdat_st[ent].length = hdr->length;
> +
> +        while (cdat->buf + i <
> +               (uint8_t *)cdat_st[ent].base + cdat_st[ent].length) {
> +            assert(i < file_size);
> +            sum += cdat->buf[i++];
> +        }
> +
> +        ent++;
> +    }
> +
> +    if (sum != 0) {
> +        warn_report("CDAT: Found checksum mismatch in %s", cdat->filename);
> +    }
> +    cdat->entry_len = num_ent;
> +    cdat->entry = g_steal_pointer(&cdat_st);
> +}
> +
> +void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
> +{
> +    CDATObject *cdat = &cxl_cstate->cdat;
> +
> +    if (cdat->filename) {
> +        ct3_load_cdat(cdat, errp);
> +    } else {
> +        ct3_build_cdat(cdat, errp);
> +    }
> +}

None of the callsites to this function check for it
failing. In particular they do not assume "if I call
this and it fails then I need to call cxl_doe_cdata_release()
to have it clean up". It would probably be less confusing
if the init function cleans up after itself, i.e. does not
leave allocated memory pointed to by cdat->buf and so on.

thanks
-- PMM

