Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3664732AC61
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:49:26 +0100 (CET)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCtR-0002Gq-8j
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCpA-0007sS-E4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:45:00 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:60603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCp8-0007eX-H3
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:45:00 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4alK-1lFYvc0DeY-001lVr; Tue, 02 Mar 2021 22:44:50 +0100
Subject: Re: [PATCH v2 22/42] esp: move PDMA length adjustments into
 esp_pdma_read()/esp_pdma_write()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-23-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8a6d3d66-04fb-7510-7940-5e194ef469ba@vivier.eu>
Date: Tue, 2 Mar 2021 22:44:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-23-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S2CIIV6LfwVkdGKTzrEXXYpc4bq6Zuo1P4rxahtr5x3A2i89r9g
 n61NwbuYHXgPSFMximwOvzBQARdjtUppOba4RBLhSlp7QL3Nt+8Z4XRMKLacXV2cxXhNatj
 kpI6lGmUbzVs+s63AbUZnjjm7vffbPyyB2NxsK+RQumZXUtL8KFmZSbozdZLcj4jiFj+j4z
 +apKv2TvpWMsPRDUF5N8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HCF8aFPEbHY=:SVXdL/RRl9It5jv31a6SY8
 xKzYIBbzqMe8dqYUeL0ofHyO9jSzM++H56bu1Xz9wM6NWIWYfyHzIKuQTR+ji3OzFrsa/BDjf
 qZdHy22sa1TsTFkiOr8idOh9s+0uSxGt7aIHjRuS0Ui43Ha+Hyf57hrSRgDXMiPP7paR9exPa
 berano5L3clkNGKZdUx2WNktRSzep5CEaLR2s7YQQ9vGUekm3V321kw3mSa1Hkz854A9rCS6U
 tTLneg/wfac/OG2F/+FPzUyjyjSTFOwBdYT3JzkidAEjWGGpgoP6TliGZrDZ9qnbRwkx6un2U
 bPby1jjZnQ4i/f1amlVpuP5BzXXbQLZH5OQUX/0lhYpsXsa28WN7jXR+GisBQ1zXNkhuEdcPC
 gx7JcMaGTwarMzAlQhC8DLUnlygU86s+qxJSSCWaziGD+6Dro+s8or/XUHzOElRFSmdIfSbHM
 biJr/ssGQA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> Here the updates to async_len and ti_size are moved into the corresponding
> esp_pdma_read()/esp_pdma_write() function to eliminate the reference to
> pdma_cur in do_dma_pdma_cb().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 91f65a5d9b..691a2f4bdc 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -153,12 +153,18 @@ static uint8_t esp_pdma_read(ESPState *s)
>          s->pdma_cur++;
>          break;
>      case ASYNC:
> -        val = s->async_buf[s->pdma_cur++];
> +        val = s->async_buf[0];
> +        if (s->async_len > 0) {
> +            s->async_len--;
> +            s->async_buf++;
> +        }
> +        s->pdma_cur++;
>          break;
>      default:
>          g_assert_not_reached();
>      }
>  
> +    s->ti_size--;
>      s->pdma_len--;
>      dmalen--;
>      esp_set_tc(s, dmalen);
> @@ -183,12 +189,18 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>          s->pdma_cur++;
>          break;
>      case ASYNC:
> -        s->async_buf[s->pdma_cur++] = val;
> +        s->async_buf[0] = val;
> +        if (s->async_len > 0) {
> +            s->async_len--;
> +            s->async_buf++;
> +        }
> +        s->pdma_cur++;
>          break;
>      default:
>          g_assert_not_reached();
>      }
>  
> +    s->ti_size++;
>      s->pdma_len--;
>      dmalen--;
>      esp_set_tc(s, dmalen);
> @@ -427,7 +439,6 @@ static void esp_dma_done(ESPState *s)
>  static void do_dma_pdma_cb(ESPState *s)
>  {
>      int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
> -    int len = s->pdma_cur;
>  
>      if (s->do_cmd) {
>          s->ti_size = 0;
> @@ -436,13 +447,6 @@ static void do_dma_pdma_cb(ESPState *s)
>          do_cmd(s);
>          return;
>      }
> -    s->async_buf += len;
> -    s->async_len -= len;
> -    if (to_device) {
> -        s->ti_size += len;
> -    } else {
> -        s->ti_size -= len;
> -    }
>      if (s->async_len == 0) {
>          scsi_req_continue(s->current_req);
>          /*
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

